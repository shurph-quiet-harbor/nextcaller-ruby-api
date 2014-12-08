require_relative './test_base'
require_relative './constants'

class PlatformUserTestCase < BaseTestCase

  def initialize(name)
    @platform_username = 'user12345'
    super(name)
  end

  def test_platform_user_by_wrong_platform
    @platform_username = 'user#12345'
    stub_request(:get, prepare_url_for_test('platform_users/%s' % @platform_username)).to_return(:body => PLATFORM_USER_JSON_RESULT, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_platform_user(@platform_username) }
  end

  def test_platform_user_json_request
    stub_request(:get, prepare_url_for_test('platform_users/%s' % @platform_username)).to_return(:body => PLATFORM_USER_JSON_RESULT, :status => 200)
    res = @client_platform.get_platform_user(@platform_username)
    assert_equal(res['total_calls']['2014­03'], 7)
    assert_equal(res['number_of_operations'], 24)
  end

  def test_platform_update_user_by_wrong_platform
    @platform_username = 'user#12345'
    stub_request(:post, prepare_url_for_test('platform_users/%s' % @platform_username)).to_return(:status => 204)
    assert_raises(ArgumentError) { @client_platform.update_platform_user(@platform_username) }
  end

  def test_platform_update_user_json_request
    stub_request(:post, prepare_url_for_test('platform_users/%s' % @platform_username)).to_return(:status => 204)
    res = @client_platform.update_platform_user(@platform_username, PLATFORM_USER_JSON_REQUEST_EXAMPLE)
    assert_equal(res.code, '204')
  end

end