# frozen_string_literal: true

require 'test_helper'

class SiteContentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get site_contents_show_url
    assert_response :success
  end
end
