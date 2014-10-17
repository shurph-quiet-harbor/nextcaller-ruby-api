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

    require 'nextcaller_client'
    api_key = "XXXXX"
    api_secret = "YYYYY"
    phone_number = "121212..."
    client = NextcallerClient::Client.new(api_key, api_secret)
    resp = client.get_by_phone(phone_number)
    print resp
    
**Initializing client**

    require 'nextcaller_client'
    api_key = "XXXXX"
    api_secret = "YYYYY"
    client = NextcallerClient::Client.new(api_key, api_secret)
    
**Get profile by phone**

    resp = client.get_by_phone(phone, response_format, debug)
    
    # arguments:
    #   phone           -- 10 digits phone, str or int, required
    #   debug           -- boolean (default false)

**Get profile by id**

    resp = client.get_by_profile_id(profile_id, response_format, debug)
    
    # arguments:
    #   profile_id      -- Profile identifier, required
    #   debug           -- boolean (default false)

**Update profile by id**
    
    resp = client.update_by_profile_id(profile_id, data, debug)
    
    # arguments:
    #   profile_id      -- Profile identifier, required
    #   data            -- dictionary with changed data, required
    #   debug           -- boolean (default false)
    
    # Returns 204 response in the case of the succesfull request.


##Exceptions

**NextcallerClient::HttpException**

Thrown in the case of 4xx or 5xx response from server.
'content' attribute contains parsed response body.

    
##Notes

It is possible to override the default response handler 
by passing a block to get_by_phone/get_by_profile_id/update_by_profile_id function. 
For example:

    result = client.get_by_phone(number) { |resp| {body: JSON.parse(resp.body), code: resp.code} } # resp is Net::HTTPResponse object

Default handler for get_by_* methods:
    
    JSON.parse(resp.body)
