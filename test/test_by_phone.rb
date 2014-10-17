require_relative './test_base'

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

class PhoneTestCase < BaseTestCase

  def test_by_short_phone
    phone = '212555838'
    stub_request(:get, prepare_url_for_test('records')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client.get_by_phone(phone)}
  end

  def test_by_wrong_phone
    phone = 'XXXXXXXXXX'
    stub_request(:get, prepare_url_for_test('records')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client.get_by_phone(phone)}
  end

  def test_by_phone_json_request
    phone = '2125558383'
    stub_request(:get, prepare_url_for_test('records')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client.get_by_phone(phone)
    refute_nil(res['records'])
    assert_equal(res['records'][0]['email'], 'demo@nextcaller.com')
    assert_equal(res['records'][0]['first_name'], 'Jerry')
    assert_equal(res['records'][0]['last_name'], 'Seinfeld')
  end

end