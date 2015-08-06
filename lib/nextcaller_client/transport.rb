module NextcallerClient

  class Transport

    attr_accessor :auth, :user_agent, :log

    def initialize(auth, user_agent=DEFAULT_USER_AGENT, platform=false)
      @auth = auth
      @user_agent = user_agent
      @log = Logger.new(STDOUT)
      @log.level = Logger::DEBUG
    end

    def make_http_request(url, method='GET', debug=false, data={}, account_id: nil)
      uri = URI.parse(url)
      case method
        when 'GET'
          request = Net::HTTP::Get.new('%s?%s' % [uri.path, uri.query])
        when 'POST'
          request = Net::HTTP::Post.new('%s?%s' % [uri.path, uri.query])
          request['Content-Type'] = 'application/json'
          request.body = data
      end

      request.basic_auth(@auth[:username], @auth[:password])
      request['Connection'] = 'Keep-Alive'
      request['User-Agent'] = @user_agent if @user_agent
      request[DEFAULT_PLATFORM_ACCOUNT_HEADER] = account_id if account_id

      hostname =  /\A\[(.*)\]\z/ =~ uri.host ? $1 : uri.host # ruby prior to 1.9.3 does not have 'hostname', which removes brackets from ipv6 addresses
      https = Net::HTTP.new(hostname, uri.port)
      https.read_timeout = DEFAULT_REQUEST_TIMEOUT
      https.use_ssl = true

      # https.set_debug_output($stderr) if debug              #deep debug
      @log.debug('Request url: %s' % url) if debug
      @log.debug('Request body: %s' % data.to_s) if debug && method == 'POST'

      begin
        response = https.start { |http| http.request(request) }
        case response
          when Net::HTTPSuccess then response
          else
            if response.code.to_i.equal? 429
              raise TooManyRequestsException.new(Utils.parse_error_response(response), Utils.parse_error_response_retry_after(response))
            elsif response.code.to_i.between?(400, 499)
              raise HttpException.new(Utils.parse_error_response(response)), '%s Client Error: %s' % [response.code, response.message]
            elsif response.code.to_i.between?(500, 599)
              raise HttpException.new(Utils.parse_error_response(response)), '%s Server Error: %s' % [response.code, response.message]
            end
        end
      rescue Net::ReadTimeout
        raise HttpException.new({}), 'Server Error: read timeout error'
      end
    end

  end

end