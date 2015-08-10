require '../lib/nextcaller_client'

api_username = 'XXXXX'
password = 'XXXXX'
sandbox = false
account_id = 'user12345'
profile_id = '97d949a413f4ea8b85e9586e1f2d9a'

client = NextcallerClient::NextCallerPlatformClient.new(api_username, password, sandbox)

begin
  response_content = client.get_by_profile_id(profile_id, account_id)
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
# First name: Jerry
# {
#   {
#     "id"=>"97d949a413f4ea8b85e9586e1f2d9a", 
#     "first_name"=>"Jerry", 
#     "middle_name"=>"", 
#     "last_name"=>"Seinfeld", 
#     "name"=>"Jerry Seinfeld", 
#     "language"=>"English", 
#     "phone"=>[
#       {
#         "number"=>"2125558383", 
#         "resource_uri"=>"/v2/records/2125558383/"
#       }
#     ], 
#     "carrier"=>"Verizon Wireless", 
#     "address"=>[
#       {
#         "city"=>"New York", 
#         "extended_zip"=>"", 
#         "country"=>"USA", 
#         "line1"=>"129 West 81st Street", 
#         "line2"=>"Apt 5a", 
#         "state"=>"NY", 
#         "zip_code"=>"10024"
#       }
#     ], 
#     "line_type"=>"", 
#     "department"=>"not specified", 
#     "resource_uri"=>"/v2/users/97d949a413f4ea8b85e9586e1f2d9a/"
#   }
# }