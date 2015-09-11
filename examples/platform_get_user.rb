require '../lib/nextcaller_client'

api_username = 'XXXXX'
api_password = 'XXXXX'
sandbox = false
account_id = 'user12345'

client = NextcallerClient::NextCallerPlatformClient.new(api_username, api_password, sandbox)

begin
  response_content = client.get_platform_account(account_id)
  puts response_content.class # Response is a hash
  puts "First name: " + response_content['first_name'] # Retrieve first name for example
  puts response_content
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Output:
# Hash
# First name: platform_user1_fname
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
