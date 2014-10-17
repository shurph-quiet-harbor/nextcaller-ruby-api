require_relative './test_base'

PROFILE_JSON_REQUEST_EXAMPLE = {
    first_name: 'Clark',
    last_name: 'Kent',
    shipping_address1: {
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

class ProfileTestCase <BaseTestCase

  def initialize(name)
    @profile_id = '97d949a413f4ea8b85e9586e1f2d9a'
    super(name)
  end

  def test_profile_get_json_request
    stub_request(:get, prepare_url_for_test('users/')).to_return(:body => PROFILE_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client.get_by_profile_id(@profile_id)
    assert_equal(res['email'], 'demo@nextcaller.com')
    assert_equal(res['first_name'], 'Jerry')
    assert_equal(res['last_name'], 'Seinfeld')
  end

  def test_profile_update_json_request
    stub_request(:post, prepare_url_for_test('users/')).to_return(:status => 204)
    res = @client.update_by_profile_id(@profile_id, PROFILE_JSON_REQUEST_EXAMPLE)
    assert_equal(res.code, '204')
  end
end
