# encoding: utf-8
require 'test/unit'
require 'two-legged-oauth'

class AccessTokenTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_initialize
    @access_token = OAuth::TwoLeggedAccessToken.new(consumer, xoauth_requestor_id)

    assert_equal xoauth_requestor_id, @access_token.xoauth_requestor_id
    assert_equal consumer, @access_token.consumer
    assert_equal Hash.new, @access_token.params
    assert_equal "", @access_token.token
    assert_equal "", @access_token.secret
  end

  #######
  private
  #######

  def consumer
    @consumer ||= OAuth::Consumer.new(consumer_key, consumer_key_secret)
  end

  def xoauth_requestor_id
    @xoauth_requestor_id ||= settings['xoauth_requestor_id']
  end

  def consumer_key
    @consumer_key ||= settings['consumer_key']
  end

  def consumer_key_secret
    @consumer_key_secret ||= settings['consumer_key_secret']
  end

  def settings
    @fixtures ||= YAML.load_file(File.join(File.dirname(__FILE__), 'settings.yml'))
  end

end
