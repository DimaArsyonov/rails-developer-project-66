# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    match 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth, via: %i[get post]
    delete '/logout', to: 'auth#logout', as: :logout

    if Rails.env.test?
      post '/test/session', to: 'test_sessions#create'
    end
  end
end
