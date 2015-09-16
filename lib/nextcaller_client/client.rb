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
    #
    def get_by_phone(phone)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required, length is 30
    #
    def get_by_profile_id(profile_id)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by name and address
    # arguments:
    #   data                -- dictionary with changed data, required
    #
    def get_by_name_address(name_address_data)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }.merge(name_address_data)
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by email
    # arguments:
    #   email      -- Email, required, str, length is 30
    #
    def get_by_email(email)
      url_params = {
          email: email,
          format: JSON_RESPONSE_FORMAT,
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')

      block_given? ? yield(response) : JSON.parse(response.body)
    end


    # Update profile by id
    # arguments:
    #   profile_id      -- Profile identifier, required, length is 30
    #   data            -- dictionary with changed data, required
    #
    def update_by_profile_id(profile_id, data)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', data)

      block_given? ? yield(response) : response
    end

    # Get fraud level for phone
    # arguments:
    #   phone           -- 10 digits phone, str ot int, required
    #
    def get_fraud_level(phone)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('fraud/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')

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
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   profile_id          -- Profile identifier, required, length is 30
    #   account_id   -- platform username, str.
    #
    def get_by_profile_id(profile_id, account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by name and address
    # arguments:
    #   data                -- dictionary with changed data, required
    #   account_id   -- platform username, str.
    #
    def get_by_name_address(name_address_data, account_id)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }.merge(name_address_data)
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profile by email
    # arguments:
    #   email      -- Email, required, str, length is 30
    #
    def get_by_email(email, account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      url_params = {
          format: JSON_RESPONSE_FORMAT,
          email: email
      }
      url = Utils.prepare_url('records/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get profiles by phone
    # arguments:
    #   profile_id          -- Profile identifier, required, length is 30
    #   data                -- dictionary with changed data, required
    #   account_id   -- platform username, str.
    #
    def update_by_profile_id(profile_id, account_id=DEFAULT_PLATFORM_ACCOUNT_ID, data)
      url_params = {
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('users/%s/' % profile_id, @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', data, account_id: account_id)

      block_given? ? yield(response) : response
    end

    # Get platform statistics
    # arguments:
    #   page               -- integer (default 1)
    #
    def get_platform_statistics(page=1)
      url_params = {
          page: page,
          format: JSON_RESPONSE_FORMAT,
      }
      url = Utils.prepare_url('accounts/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')
      puts response.body
      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Get platform user
    # arguments:
    #   account_id   -- platform username, str.
    #
    def get_platform_account(account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('accounts/%s/' % account_id, @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET')

      block_given? ? yield(response) : JSON.parse(response.body)
    end

    # Create platform account
    # arguments:
    #   data                -- dictionary with changed data, required
    #
    def create_platform_account(data)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('accounts/', @sandbox, url_params)
      data = Utils.prepare_json_data(data)
      response = @transport.make_http_request(url, 'POST', data)

      block_given? ? yield(response) : response
    end

    # Update platform user data
    # arguments:
    #   account_id   -- platform username, str.
    #   data                -- dictionary with changed data, required
    #
    def update_platform_account(account_data, account_id)
      url_params = {
          format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('accounts/%s/' % account_id, @sandbox, url_params)
      data = Utils.prepare_json_data(account_data)
      response = @transport.make_http_request(url, 'POST', data)

      block_given? ? yield(response) : response
    end


    # Get profiles by phone
    # arguments:
    #   phone               -- 10 digits phone, str ot int, required
    #   data                -- dictionary with changed data, required
    #   account_id   -- platform username, str.
    #
    def get_fraud_level(phone, account_id=DEFAULT_PLATFORM_ACCOUNT_ID)
      url_params = {
        phone: phone,
        format: JSON_RESPONSE_FORMAT
      }
      url = Utils.prepare_url('fraud/', @sandbox, url_params)
      response = @transport.make_http_request(url, 'GET', account_id: account_id)

      block_given? ? yield(response) : JSON.parse(response.body)
    end


  end

end

