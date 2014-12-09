require 'nextcaller_client'

username = 'XXXXX'
password = 'XXXXX'
sandbox = false
profile_id = '97d949a413f4ea8b85e9586e1f2d9a'

client = NextcallerClient::NextCallerClient.new(username, password, sandbox)

begin
  data = { 
    first_name: "Clark",
    last_name:"Kent",
    email:"clarkkent@supermail.com",
    phone1:"1234567890",
    phone2:"2345678901",
    phone3:"3456789012",
    shipping_address1:{
        line1:"223 Kryptonite Ave.",
        line2:"",
        city:"Smallville",
        state:"KS",
        zip_code:"66002"
    }
  } 
  response = client.update_by_profile_id(profile_id, data)
  puts response.code
  puts 'Success'
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Response example: 
# HTTP 204 NO CONTENT