require '../lib/nextcaller_client'

api_username = 'E72D42B98D2232703EE3'
api_password = '826f22ade660d6612523b212b997094c70dba8e1'
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
#   "created"=>1439237857,
#   "created_iso"=>"2015-08-10T16:17:37.560719+00:00",
#   "spoofed"=>"unknown",
#   "ani"=>"12125558383",
#   "fraud_risk"=>"medium",
#   "cid"=>"unknown",
#   "cid_blocked"=>"no"
# }
