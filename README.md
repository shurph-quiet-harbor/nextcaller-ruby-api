# NextcallerClient

A ruby wrapper around the Nextcaller API.

[![Build Status](https://travis-ci.org/Nextcaller/nextcaller-ruby-api.svg?branch=master)](https://travis-ci.org/Nextcaller/nextcaller-ruby-api)

## Installation

Add this line to your application's Gemfile:

    gem 'nextcaller_client'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nextcaller_client
    

## Usage

**Example**

    require '../lib/nextcaller_client'
    api_username = "XXXXX"
    api_password = "YYYYY"
    phone_number = "121212..."
    client = NextcallerClient::NextCallerClient.new(api_username, api_password)
    resp = client.get_by_phone(phone_number)
    print resp
    
**Initializing client**

    require '../lib/nextcaller_client'
    api_username = "XXXXX"
    api_password = "YYYYY"
    client = NextcallerClient::NextCallerClient.new(api_username, api_password)
    
**Get profile by phone**

    resp = client.get_by_phone(phone)
    
    # arguments:
    #   phone           -- 10 digits phone, str or int, required


**Get profile by id**

    resp = client.get_by_profile_id(profile_id)
    
    # arguments:
    #   profile_id      -- Profile identifier, required


**Update profile by id**
    
    resp = client.update_by_profile_id(profile_id, data)
    
    # arguments:
    #   profile_id      -- Profile identifier, required
    #   data            -- dictionary with changed data, required

    
    # Returns 204 response in the case of the succesfull request.

**Get fraud level**

    resp = client.get_fraud_level(phone)

    # arguments:
    #   phone           -- 10 digits phone, str or int, required



##Errors handling

In case of wrong phone number a ArgumentError exception will be thrown:

    ArgumentError('Invalid phone number: 1221. .........)

In case of wrong profile id a ArgumentError exception will be thrown:

    ArgumentError('Invalid profile id: assw2. .........)

In case of wrong platform name a ArgumentError exception will be thrown:

    ArgumentError('Invalid platform name: sd#s. .........)

[NextcallerClient::HttpException](https://github.com/Nextcaller/nextcaller-ruby-api/blob/master/lib/nextcaller_client/exceptions.rb) exeception is raised in the case of 4xx or 5xx response from server. 'content' attribute contains parsed response body.

    
##Notes

It is possible to override the default response handler 
by passing a block to get_by_phone/get_by_profile_id/update_by_profile_id function. 
For example:

    result = client.get_by_phone(number) { |resp| {body: JSON.parse(resp.body), code: resp.code} } # resp is Net::HTTPResponse object

Default handler for get_by_* methods:
    
    JSON.parse(resp.body)
