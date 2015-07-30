require_relative './test_base'
require_relative './constants'

class PlatformPhoneTestCase < BaseTestCase

  def initialize(name)
    @phone = '2125558383'
    @account_id = 'user12345'
    super(name)
  end

  def test_by_wrong_phone
    @phone = '212555838'
    stub_request(:get, prepare_url_for_test('records')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_by_phone(@phone, @account_id) }
  end

  def test_by_wrong_platform
    @account_id = 'user#12345'
    stub_request(:get, prepare_url_for_test('records')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_by_phone(@phone, @account_id) }
  end

  def test_by_phone_json_request
    stub_request(:get, prepare_url_for_test('records')).to_return(:body => PHONE_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client_platform.get_by_phone(@phone, @account_id)
    refute_nil(res['records'])
    assert_equal(res['records'][0]['email'], 'demo@nextcaller.com')
    assert_equal(res['records'][0]['first_name'], 'Jerry')
    assert_equal(res['records'][0]['last_name'], 'Seinfeld')
  end

end