require_relative './test_base'
require_relative './constants'

class AddressNameTestCase < BaseTestCase

  def initialize(name)
    @address_data = {
        'first_name' => 'Jerry',
        'last_name' => 'Seinfeld',
        'address' => '129 West 81st Street',
        'city' => 'New York',
        'state' => 'NY',
        'zip_code' => '10024'
    }
    super(name)
  end

  def test_profile_get_name_address_json_request
    stub_request(:get, prepare_url_for_test('records/')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client.get_by_address_name(@address_data)

    assert_equal(res['records'][0]['email'], 'demo@nextcaller.com')
    assert_equal(res['records'][0]['first_name'], 'Jerry')
    assert_equal(res['records'][0]['last_name'], 'Seinfeld')
  end

end