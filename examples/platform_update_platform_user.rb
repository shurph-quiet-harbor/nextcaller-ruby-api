require 'nextcaller_client'

api_username = 'XXXXX'
api_password = 'XXXXX'
sandbox = false
account_id = 'user12345'

client = NextcallerClient::NextCallerPlatformClient.new(api_username, api_password, sandbox)

begin
  data = { email: 'test@test.com' } 
  response = client.update_platform_user(account_id, data)
  puts response.class # Response is a object of Net::HTTPNoContent
  puts 'Success'
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Output: 
# Net::HTTPNoContent
# Success