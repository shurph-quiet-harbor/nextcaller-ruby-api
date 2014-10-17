module NextcallerClient
  #The NextCaller API client
  class Client

    attr_accessor :auth

    def initialize(api_key, api_secret)
      auth = {username: api_key, password: api_secret}
      @transport = Transport.new(auth, DEFAULT_USER_AGENT)
    end

    # Get profiles by phone
    # arguments:
    #   phone           -- 10 digits phone, str ot int, required
    #   debug           -- boolean (default false)
    #
    def get_by_phone(phone, debug=false)

      method = 'GET'
      Utils.validate_phone(phone)
      url_params = {
          phone: phone,
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records', url_params)
      response = @transport.make_http_request(url, method, debug)

      if block_given?
        yield response
      else
        JSON.parse(response.body)
      end
    end

    # Get profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required
    #   debug           -- boolean (default false)
    #
    def get_by_profile_id(profile_id, debug=false)

      method = 'GET'
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, url_params)
      response = @transport.make_http_request(url, method, debug)

      if block_given?
        yield response
      else
        JSON.parse(response.body)
      end
    end

    # Update profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required
    #   data            -- dictionary with changed data, required
    #   debug           -- boolean (default false)
    #
    def update_by_profile_id(profile_id, data, debug=false)

      method = 'POST'
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, method, debug, data)

      if block_given?
        yield response
      else
        response
      end
    end

  end

end

