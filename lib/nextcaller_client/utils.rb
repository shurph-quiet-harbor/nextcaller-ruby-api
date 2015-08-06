module NextcallerClient

  module Utils

    def self.prepare_json_data(data)
      unless data.is_a? Hash
        raise ArgumentError, 'Data should be a hash.'
      end
      data.to_json
    end

    def self.parse_error_response_retry_after(resp)
      resp['Retry-After']
    end

    def self.parse_error_response(resp)
      if resp['Content-Type'].include? 'application/json'
        JSON.parse(resp.body)
      else
        resp.body
      end
    end

    def self.format_phone_number(phone_number)
      phone_number.delete('^0-9')
    end

    #Validate address_data
    def self.validate_address(address_data)

      unless address_data
          raise ArgumentError, 'Invalid address data: %s. Address data should be filled.' % address_data
      end
      unless address_data.kind_of? Hash
          raise ArgumentError, 'Invalid address data: %s. Address data cannot be type of %s.' % address_data, address_data.class
      end
    end

    #Prepare url from path and params
    def self.prepare_url(path, sandbox, url_params={})
      url = '%s%s' % [sandbox ? FULL_SANDBOX_URL : FULL_URL, path]
      unless url.end_with?('/')
        url += '/'
      end
      unless url_params.empty?
        url_params_str = url_params.collect { |k, v| "#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}" }.join('&')
        url += "?#{url_params_str}"
      end
      url
    end

  end

end
