require_relative './test_base'
require_relative './constants'

class FraudLevelTestCase < BaseTestCase

  def initialize(name)
    @phone = '2125558383'
    super(name)
  end

  def test_fraud_level_json_request
    stub_request(:get, prepare_url_for_test('fraud/')).to_return(:body => FRAUD_LEVEL_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client.get_fraud_level(@phone)
    assert_equal(res['spoofed'], 'false')
    assert_equal(res['fraud_risk'], 'low')
  end
  
end
