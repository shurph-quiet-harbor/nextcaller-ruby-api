require 'nextcaller_client'

username = 'XXXXX'
password = 'XXXXX'
sandbox = false
profile_id = '97d949a413f4ea8b85e9586e1f2d9a'
account_id = 'user12345'

client = NextcallerClient::NextCallerPlatformClient.new(username, password, sandbox)

begin
  data = { email: 'test@test.com' } 
  response = client.update_by_profile_id(profile_id, account_id, data)
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