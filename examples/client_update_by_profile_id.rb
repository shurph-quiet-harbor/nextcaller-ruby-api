require 'nextcaller_client'

api_username = 'F72T45B99D2432723EC9'
api_password = '327f22vde660z6622623b812b00709xc70dbb8ef'
sandbox = false
profile_id = '97d949a413f4ea8b85e9586e1f2d9a'

client = NextcallerClient::NextCallerClient.new(api_username, api_password, sandbox)

begin
  data = { 
    first_name: "Clark",
    last_name:"Kent",
    email:"clarkkent@supermail.com",
    shipping_address1:{
        line1:"223 Kryptonite Ave.",
        line2:"",
        city:"Smallville",
        state:"KS",
        zip_code:"66002"
    }
  } 
  response = client.update_by_profile_id(profile_id, data)
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