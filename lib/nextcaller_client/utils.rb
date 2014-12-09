module NextcallerClient

  module Utils

    def self.prepare_json_data(data)
      unless data.is_a? Hash
        raise ArgumentError, 'Data should be a hash.'
      end
      data.to_json
    end

    def self.parse_error_response(resp)
      if resp['Content-Type'].include? 'application/json'
        JSON.parse(resp.body)
      else
        resp.body
      end
    end

    #Validate phone format
    def self.validate_phone(value, length=DEFAULT_PHONE_LENGTH)
      value = value.to_s
      unless value =~ /^[0-9]{#{length}}$/
        raise ArgumentError, 'Invalid phone number: %s. Phone should consists of #{length} digits.' % value
      end
    end

    #Validate porfile id
    def self.validate_profile_id(value, length=DEFAULT_PROFILE_ID_LENGTH)
      value = value.to_s
      unless value =~ /^[0-9a-zA-Z]{#{length}}$/
        raise ArgumentError, 'Invalid profile id: %s. Profile id should consists of #{length} characters.' % value
      end
    end

    #Validate platform_username
    def self.validate_platform_username(value)
      value = value.to_s
      if value =~ /\W/
        raise ArgumentError, 'Invalid platform name: %s. Platfrom name should contain only an alphanumeric character, including _.' % value
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
