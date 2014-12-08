module NextcallerClient
  #The NextCaller API client
  class NextCallerClient

    attr_accessor :auth

    def initialize(username, password, sandbox=false)
      auth = {username: username, password: password}
      @sandbox = sandbox
      @transport = Transport.new(auth, DEFAULT_USER_AGENT)
    end

    # Get profiles by phone
    # arguments:
    #   phone           -- 10 digits phone, str ot int, required
    #   debug           -- boolean (default false)
    #
    def get_by_phone(phone, debug=false)
      Utils.validate_phone(phone)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required, length is 30
    #   debug           -- boolean (default false)
    #
    def get_by_profile_id(profile_id, debug=false)
      Utils.validate_profile_id(profile_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Update profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required, length is 30
    #   data            -- dictionary with changed data, required
    #   debug           -- boolean (default false)
    #
    def update_by_profile_id(profile_id, data, debug=false)
      Utils.validate_profile_id(profile_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', debug, data)

      block_given? ? yield(response) : response
    end

    # Get fraud level for phone
    # arguments:
    #   phone           -- 10 digits phone, str ot int, required
    #   debug           -- boolean (default false)
    #
    def get_fraud_level(phone, debug=false)
      Utils.validate_phone(phone)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('fraud/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

  end


  #The NextCaller platform API client
  class NextCallerPlatformClient < NextCallerClient

    # Get profiles by phone
    # arguments:
    #   phone               -- 10 digits phone, str ot int, required
    #   platform_username   -- platform username, str.
    #   debug               -- boolean (default false)
    #
    def get_by_phone(phone, platform_username, debug=false)
      Utils.validate_phone(phone)
      Utils.validate_platform_username(platform_username)
      url_params = {
        phone: phone,
        platform_username: platform_username, 
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   profile_id          -- Profile identifier, required, length is 30
    #   platform_username   -- platform username, str.
    #   debug               -- boolean (default false)
    #
    def get_by_profile_id(profile_id, platform_username, debug=false)
      Utils.validate_profile_id(profile_id)
      Utils.validate_platform_username(platform_username)
      url_params = {
        platform_username: platform_username,
        format: JSON_RESPONSE_FORMAT        
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   profile_id          -- Profile identifier, required, length is 30
    #   data                -- dictionary with changed data, required
    #   platform_username   -- platform username, str.
    #   debug               -- boolean (default false)
    #
    def update_by_profile_id(profile_id, platform_username, data, debug=false)
      Utils.validate_profile_id(profile_id)
      Utils.validate_platform_username(platform_username)
      url_params = {
        platform_username: platform_username, 
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', debug, data)

      block_given? ? yield(response) : response
    end

    # Get profiles by phone
    # arguments:
    #   phone               -- 10 digits phone, str ot int, required
    #   data                -- dictionary with changed data, required
    #   platform_username   -- platform username, str.
    #   debug               -- boolean (default false)
    #
    def get_fraud_level(phone, platform_username, debug=false)
      Utils.validate_phone(phone)
      Utils.validate_platform_username(platform_username)
      url_params = {
        platform_username: platform_username,
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('fraud/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get platform statistics
    # arguments:
    #   debug               -- boolean (default false)
    #
    def get_platform_statistics(debug=false)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('platform_users/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get platform user
    # arguments:
    #   platform_username   -- platform username, str.
    #   debug               -- boolean (default false)
    #
    def get_platform_user(platform_username, debug=false)
      Utils.validate_platform_username(platform_username)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('platform_users/%s/' % platform_username, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Update platform user data
    # arguments:
    #   platform_username   -- platform username, str.
    #   data                -- dictionary with changed data, required
    #   debug               -- boolean (default false)
    #
    def update_platform_user(platform_username, data, debug=false)
      Utils.validate_platform_username(platform_username)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('platform_users/%s/' % platform_username, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', debug, data)

      block_given? ? yield(response) : response
    end  

  end

end

