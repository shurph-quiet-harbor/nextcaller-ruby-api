require 'nextcaller_client'

api_username = 'XXXXX'
api_password = 'XXXXX'
sandbox = false

client = NextcallerClient::NextCallerPlatformClient.new(api_username, api_password, sandbox)

begin
  response_content = client.get_platform_statistics
  puts response_content.class # Response is a hash
  puts "Platform name: " + response_content['data'][0]['id'] # Retrieve platform name for example
  puts response_content
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Output:
# Hash
# Platform name: user1
# {
#   "object_list"=>[
#     {
#       "username"=>"user1", 
#       "first_name"=>"", 
#       "last_name"=>"", 
#       "company_name"=>"", 
#       "email"=>"", 
#       "number_of_operations"=>1777, 
#       "total_calls"=>
#         {
#           "2014-12"=>56, 
#           "2014-10"=>9, 
#           "2014-11"=>3
#         }, 
#       "successful_calls"=>
#         {
#           "2014-12"=>56, 
#           "2014-10"=>9, 
#           "2014-11"=>3
#         }, 
#       "resource_uri"=>"/v2/platform_users/user1/"
#     },
#     ...
#   ]
# }