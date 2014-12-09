require 'nextcaller_client'

username = 'XXXXX'
password = 'XXXXX'
sandbox = false
platform_username = 'user12345'

client = NextcallerClient::NextCallerPlatformClient.new(username, password, sandbox)

begin
  response_content = client.get_platform_user(platform_username)
  puts response_content
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Response example:
# {
#   "username"=>"user12345", 
#   "first_name"=>"platform_user1_fname", 
#   "last_name"=>"platform_user1_lname", 
#   "company_name"=>"platform_company1_name", 
#   "email"=>"test@test.com", 
#   "number_of_operations"=>71, 
#   "total_calls"=>
#     {
#       "2014-12"=>14, 
#       "2014-11"=>57
#     }, 
#   "successful_calls"=>
#     {
#       "2014-12"=>14, 
#       "2014-11"=>57
#     }, 
#   "resource_uri"=>"/v2/platform_users/user12345/"
# }
