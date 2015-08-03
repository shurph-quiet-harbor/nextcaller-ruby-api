module NextcallerClient
  #The NextCaller API client
  class NextCallerClient

    attr_accessor :auth

    def initialize(username, password, sandbox=false, debug=false)
      auth = {username: username, password: password}
      @sandbox = sandbox
      @debug = debug
      @transport = Transport.new(auth, DEFAULT_USER_AGENT)
    end

    # Get profiles by phone
    # arguments:
    #   phone           -- 10 digits phone, str ot int, required
    #
    def get_by_phone(phone)
      Utils.validate_phone(phone)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required, length is 30
    #
    def get_by_profile_id(profile_id)
      Utils.validate_profile_id(profile_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by name and address
    # arguments:
    #   data                -- dictionary with changed data, required
    #
    def get_by_address_name(data)
      Utils.validate_address(data)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }.merge(data)
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Update profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required, length is 30
    #   data            -- dictionary with changed data, required
    #
    def update_by_profile_id(profile_id, data)
      Utils.validate_profile_id(profile_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', @debug, data)

      block_given? ? yield(response) : response
    end

    # Get fraud level for phone
    # arguments:
    #   phone           -- 10 digits phone, str ot int, required
    #
    def get_fraud_level(phone)
      Utils.validate_phone(phone)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('fraud/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

  end


  #The NextCaller platform API client
  class NextCallerPlatformClient < NextCallerClient

    # Get profiles by phone
    # arguments:
    #   phone               -- 10 digits phone, str ot int, required
    #   account_id   -- platform username, str.
    #
    def get_by_phone(phone, account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      Utils.validate_phone(phone)
      Utils.validate_account_id(account_id)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug, account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   profile_id          -- Profile identifier, required, length is 30
    #   account_id   -- platform username, str.
    #
    def get_by_profile_id(profile_id, account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      Utils.validate_profile_id(profile_id)
      Utils.validate_account_id(account_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug, account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   profile_id          -- Profile identifier, required, length is 30
    #   data                -- dictionary with changed data, required
    #   account_id   -- platform username, str.
    #
    def update_by_profile_id(profile_id, account_id=DEFAULT_PLATFORM_ACCOUNT_ID, data)
      Utils.validate_profile_id(profile_id)
      Utils.validate_account_id(account_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', @debug, data, account_id: account_id)

      block_given? ? yield(response) : response
    end

    # Get profile by name and address
    # arguments:
    #   data                -- dictionary with changed data, required
    #   account_id   -- platform username, str.
    #
    def get_by_address_name(data, account_id)
      Utils.validate_account_id(account_id)
      Utils.validate_address(data)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }.merge(data)
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug, account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   phone               -- 10 digits phone, str ot int, required
    #   data                -- dictionary with changed data, required
    #   account_id   -- platform username, str.
    #
    def get_fraud_level(phone, account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      Utils.validate_phone(phone)
      Utils.validate_account_id(account_id)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('fraud/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug, account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get platform statistics
    # arguments:
    #   page               -- integer (default 1)
    #
    def get_platform_statistics(page=1)
      url_params = {
        format: JSON_RESPONSE_FORMAT,
        page: page,
      }
      url = Utils.prepare_url('platform_users/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug, account_id: account_id)
      puts response.body
      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get platform user
    # arguments:
    #   account_id   -- platform username, str.
    #
    def get_platform_user(account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      Utils.validate_account_id(account_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('platform_users/%s/' % account_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', @debug)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Update platform user data
    # arguments:
    #   account_id   -- platform username, str.
    #   data                -- dictionary with changed data, required
    #
    def update_platform_user(account_id=DEFAULT_PLATFORM_ACCOUNT_ID, data)
      Utils.validate_account_id(account_id)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('platform_users/%s/' % account_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', @debug, data)

      block_given? ? yield(response) : response
    end  

  end

end

