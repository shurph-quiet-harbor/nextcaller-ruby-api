# encoding: utf-8

TEST_USERNAME = 'username'
TEST_PASSWORD = 'password'

PHONE_JSON_RESULT_EXAMPLE = '
  {
    "records": [
      {
        "id": "97d949a413f4ea8b85e9586e1f2d9a",
        "first_name": "Jerry",
        "last_name": "Seinfeld",
        "name": "Jerry Seinfeld",
        "language": "English",
        "fraud_threat": "low",
        "spoof": "false",
        "phone": [
          {
            "number": "2125558383"
          }
        ],
        "carrier": "Verizon Wireless",
        "line_type": "LAN",
        "address": [
          {
            "city": "New York",
            "extended_zip": "",
            "country": "USA",
            "line2": "Apt 5a",
            "line1": "129 West 81st Street",
            "state": "NY",
            "zip_code": "10024"
          }
        ],
        "email": "demo@nextcaller.com",
        "age": "45-54",
        "gender": "Male",
        "household_income": "50k-75k",
        "marital_status": "Single",
        "presence_of_children": "No",
        "home_owner_status": "Rent",
        "market_value": "350k-500k",
        "length_of_residence": "12 Years",
        "high_net_worth": "No",
        "occupation": "Entertainer",
        "education": "Completed College",
        "department": "not specified"
      }
    ]
  }'

PROFILE_JSON_REQUEST_EXAMPLE = 
  {
    first_name: 'Clark',
    last_name: 'Kent',
    shipping_address1: 
      {
        line1: '225 Kryptonite Ave.',
        line2: '',
        city: 'Smallville',
        state: 'KS',
        zip_code: '66002'
      }
  }

PROFILE_JSON_RESULT_EXAMPLE = '
  {
    "id": "97d949a413f4ea8b85e9586e1f2d9a",
    "first_name": "Jerry",
    "last_name": "Seinfeld",
    "name": "Jerry Seinfeld",
    "language": "English",
    "fraud_threat": "low",
    "spoof": "false",
    "phone": [
      {
        "number": "2125558383"
      }
    ],
    "carrier": "Verizon Wireless",
    "line_type": "LAN",
    "address": [
      {
        "city": "New York",
        "extended_zip": "",
        "country": "USA",
        "line2": "Apt 5a",
        "line1": "129 West 81st Street",
        "state": "NY",
        "zip_code": "10024"
      }
    ],
    "email": "demo@nextcaller.com",
    "age": "45-54",
    "gender": "Male",
    "household_income": "50k-75k",
    "marital_status": "Single",
    "presence_of_children": "No",
    "home_owner_status": "Rent",
    "market_value": "350k-500k",
    "length_of_residence": "12 Years",
    "high_net_worth": "No",
    "occupation": "Entertainer",
    "education": "Completed College",
    "department": "not specified"
  }'

FRAUD_LEVEL_JSON_RESULT_EXAMPLE = '
  {
    "spoofed": "false",
    "fraud_risk": "low"
  }'

PLATFORM_STATISTICS_JSON_RESULT = '
  { 
    "platform_users": [ 
      {  
        "created_time": "2014­03­16T10:40:12", 
        "number_of_operations": 1, 
        "resource_uri": "/api/v2/platform_users/pl2_un2/", 
        "total_calls": 
          { 
            "2014­05": 2 
          }, 
        "successful_calls": 
          { 
            "2014­05": 1 
          }, 
        "billable_calls": { }, 
        "username": "pl2_un1" 
      }, 
      { 
        "created_time": "2014­04­16T13:42:00", 
        "number_of_operations": 24, 
        "resource_uri": "/api/v2/platform_users/pl2_un1/", 
        "total_calls": 
          {
            "2014­03": 7,
            "2014­04": 12, 
            "2014­05": 10 
          }, 
        "successful_calls": 
          { 
            "2014­03": 6, 
            "2014­04": 10, 
            "2014­05": 8 
          }, 
        "billable_calls": 
          { 
            "2014­04": 1, 
            "2014­05": 1 
          }, 
        "username": "pl2_un2" 
      } 
    ], 
    "total_platform_calls": 
      { 
        "2014­03": 7, 
        "2014­04": 12, 
        "2014­05": 2 
      }, 
    "successful_platform_calls": 
      {  
        "2014­03": 6, 
        "2014­04": 10, 
        "2014­05": 9 
      }, 
    "billable_platform_calls": 
      { 
        "2014­04": 1, 
        "2014­05": 1 
      } 
  }'

PLATFORM_USER_JSON_REQUEST_EXAMPLE = 
  { 
    first_name: "platform_user1_fname",  
    last_name: "platform_user1_lname",  
    company_name: "platform_company1_name",  
    email: "company_email@company1.com"  
  }

PLATFORM_USER_JSON_RESULT = '
  {
    "created_time": "2014­04­16T13:42:00", 
    "number_of_operations": 24,  
    "resource_uri": "/api/v2/platform_users/user12345/",  
    "total_calls": 
      {  
        "2014­03": 7,  
        "2014­04": 12,  
        "2014­05": 10  
      },  
    "successful_calls": 
      {  
        "2014­03": 6,  
        "2014­04": 10,  
        "2014­05": 8  
      },  
    "billable_calls": 
      {  
        "2014­04": 1,  
        "2014­05": 1  
      },  
    "username": "user12345"  
  }'