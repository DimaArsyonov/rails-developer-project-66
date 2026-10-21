# frozen_string_literal: true

class Web::TestSessionsController < Web::ApplicationController
  def create
    user = User.find_or_create_by!(email: params.require(:email).downcase)

    session[:user_id] = user.id

    head :ok
  end
end
