require 'nextcaller_client'

username = 'XXXXX'
password = 'XXXXX'
sandbox = false
platform_username = 'user12345'
profile_id = '97d949a413f4ea8b85e9586e1f2d9a'

client = NextcallerClient::NextCallerPlatformClient.new(username, password, sandbox)

begin
  response_content = client.get_by_profile_id(profile_id, platform_username)
  puts response_content
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end