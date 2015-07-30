require_relative './test_base'
require_relative './constants'

class PlatformFraudLevelTestCase < BaseTestCase

  def initialize(name)
    @phone = '2125558383'
    @account_id = 'user12345'
    super(name)
  end

  def test_platform_fraud_level_json_request
    stub_request(:get, prepare_url_for_test('fraud/')).to_return(:body => FRAUD_LEVEL_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client_platform.get_fraud_level(@phone, @account_id)
    assert_equal(res['spoofed'], 'false')
    assert_equal(res['fraud_risk'], 'low')
  end

  def test_fraud_level_by_wrong_phone
    @phone = '123'
    stub_request(:get, prepare_url_for_test('fraud/')).to_return(:body => FRAUD_LEVEL_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_fraud_level(@phone, @account_id) }
  end

  def test_fraud_level_by_wrong_platform
    @account_id = 'user#12345'
    stub_request(:get, prepare_url_for_test('fraud/')).to_return(:body => FRAUD_LEVEL_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_fraud_level(@phone, @account_id) }
  end

end
