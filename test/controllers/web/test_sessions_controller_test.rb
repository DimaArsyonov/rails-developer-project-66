# frozen_string_literal: true

require 'test_helper'

class Web::TestSessionsControllerTest < ActionDispatch::IntegrationTest
  test 'creates session for user' do
    assert_difference('User.count', 1) do
      post '/test/session', params: { email: 'user@example.com' }
    end

    assert_response :ok
  end

  test 'uses existing user' do
    User.create!(email: 'user@example.com')

    assert_no_difference('User.count') do
      post '/test/session', params: { email: 'user@example.com' }
    end

    assert_response :ok
  end
end
