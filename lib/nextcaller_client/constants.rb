module NextcallerClient
  # default values
  DEFAULT_REQUEST_TIMEOUT = 60
  JSON_RESPONSE_FORMAT = 'json'
  DEFAULT_PHONE_LENGTH = 10
  DEFAULT_PROFILE_ID_LENGTH = 30
  DEFAULT_USER_AGENT = 'nextcaller/ruby/%s' % VERSION

  # urls
  BASE_URL = 'api.nextcaller.com/v2/'
  FULL_URL = 'https://api.nextcaller.com/v2/'
  FULL_SANDBOX_URL = 'https://api.sandbox.nextcaller.com/v2/'

end
