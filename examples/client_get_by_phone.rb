require 'nextcaller_client'

api_username = 'XXXXX'
api_password = 'XXXXX'
sandbox = false
phone_number = '2125558383'

client = NextcallerClient::NextCallerClient.new(api_username, api_password, sandbox)

begin
  response_content = client.get_by_phone(phone_number)
  puts response_content.class # Response is a hash
  puts "First name: " + response_content['records'][0]['first_name'] # Retrieve first name for example
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
#   "records":[
#     {
#       "id": "97d949a413f4ea8b85e9586e1f2d9a", 
#       "first_name": "Jerry", 
#       "middle_name": "", 
#       "last_name": "Seinfeld", 
#       "name": "Jerry Seinfeld", 
#       "language": "English", 
#       "phone":[
#         {
#           "number": "2125558383", 
#           "resource_uri": "/v2/records/2125558383/"
#         }
#       ], 
#       "carrier": "Verizon Wireless", 
#       "address":[
#         {
#           "city": "New York", 
#           "extended_zip": "", 
#           "country": "USA", 
#           "line1": "129 West 81st Street", 
#           "line2": "Apt 5a", "state": "NY", 
#           "zip_code": "10024"
#         }
#       ], 
#       "relatives": [], 
#       "email": "demo@nextcaller.com", 
#       "linked_emails": ["demo@nextcaller.com"], 
#       "social_links": [], 
#       "age": "", 
#       "education": "", 
#       "gender": "Male", 
#       "high_net_worth": "", 
#       "home_owner_status": "", 
#       "household_income": "", 
#       "length_of_residence": "", 
#       "line_type": "", 
#       "marital_status": "", 
#       "market_value": "", 
#       "occupation": "", 
#       "presence_of_children": "", 
#       "department": "not specified", 
#       "resource_uri": "/v2/users/97d949a413f4ea8b85e9586e1f2d9a/"
#     }
#   ]
# }