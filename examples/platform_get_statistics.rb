require 'nextcaller_client'

username = 'XXXXX'
password = 'XXXXX'
sandbox = false

client = NextcallerClient::NextCallerPlatformClient.new(username, password, sandbox)

begin
  response_content = client.get_platform_statistics
  puts response_content
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end