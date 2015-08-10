require '../lib/nextcaller_client'

api_username = 'XXXXX'
api_password = 'XXXXX'
sandbox = false
phone_number = '2125558383'

client = NextcallerClient::NextCallerClient.new(api_username, api_password, sandbox)

begin
  response_content = client.get_fraud_level(phone_number)
  puts response_content.class # Response is a hash
  puts "Fraud risk: " + response_content['fraud_risk'] # Retrieve fraud risk for example
  puts response_content
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Output:
# Hash
# Fraud risk: medium
# { 
#   "fraud_risk"=>"medium", 
#   "spoofed"=>"unknown"
# }