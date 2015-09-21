require_relative './test_base'
require_relative './constants'

class PlatformUserTestCase < BaseTestCase

  def initialize(name)
    @account_id = 'user12345'
    super(name)
  end

  def test_platform_user_json_request
    stub_request(:get, prepare_url_for_test('accounts/%s' % @account_id)).to_return(:body => PLATFORM_USER_JSON_RESULT, :status => 200)
    res = @client_platform.get_platform_account(@account_id)
    assert_equal(res['number_of_operations'], 24)
  end

  def test_platform_update_user_json_request
    stub_request(:post, prepare_url_for_test('accounts/%s' % @account_id)).to_return(:status => 204)
    res = @client_platform.update_platform_account(PLATFORM_USER_JSON_REQUEST_EXAMPLE, @account_id)
    assert_equal(res.code, '204')
  end

end