require_relative './test_base'
require_relative './constants'

class PlatformStatisticsTestCase < BaseTestCase

  def test_platform_statistics_json_response
    stub_request(:get, prepare_url_for_test('accounts/')).to_return(:body => PLATFORM_STATISTICS_JSON_RESULT, :status => 200)
    res = @client_platform.get_platform_statistics(1)
    assert_equal(res['platform_users'][0]['username'], 'pl2_un1')
    assert_equal(res['platform_users'][1]['username'], 'pl2_un2')
  end

end