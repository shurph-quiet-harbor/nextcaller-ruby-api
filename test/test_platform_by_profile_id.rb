require_relative './test_base'
require_relative './constants'

class PlatformProfileTestCase < BaseTestCase

  def initialize(name)
    @profile_id = '97d949a413f4ea8b85e9586e1f2d9a'
    @platform_username = 'user12345'
    super(name)
  end

  def test_platform_profile_get_json_request
    stub_request(:get, prepare_url_for_test('users/')).to_return(:body => PROFILE_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client_platform.get_by_profile_id(@profile_id, @platform_username)
    assert_equal(res['email'], 'demo@nextcaller.com')
    assert_equal(res['first_name'], 'Jerry')
    assert_equal(res['last_name'], 'Seinfeld')
  end

  def test_platform_profile_by_wrong_profile_id
    @profile_id = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    stub_request(:get, prepare_url_for_test('users/')).to_return(:body => PROFILE_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_by_profile_id(@profile_id, @platform_username) }
  end

  def test_platform_profile_by_wrong_platform
    @platform_username = 'user#12345'
    stub_request(:get, prepare_url_for_test('users/')).to_return(:body => PROFILE_JSON_RESULT_EXAMPLE, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_by_profile_id(@profile_id, @platform_username) }
  end

  def test_platform_profile_update_json_request_by_wrong_profile_id
    @profile_id = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    stub_request(:post, prepare_url_for_test('users/')).to_return(:status => 204)
    assert_raises(ArgumentError) { @client_platform.update_by_profile_id(@profile_id, @platform_username) }
  end

  def test_platform_profile_update_json_request_by_wrong_wrong_platform
    @platform_username = 'user#12345'
    stub_request(:post, prepare_url_for_test('users/')).to_return(:status => 204)
    assert_raises(ArgumentError) { @client_platform.update_by_profile_id(@profile_id, @platform_username) }
  end

  def test_platform_profile_update_json_request
    stub_request(:post, prepare_url_for_test('users/')).to_return(:status => 204)
    res = @client_platform.update_by_profile_id(@profile_id, @platform_username, PROFILE_JSON_REQUEST_EXAMPLE)
    assert_equal(res.code, '204')
  end

end
