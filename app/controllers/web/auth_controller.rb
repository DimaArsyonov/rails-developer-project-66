# frozen_string_literal: true

class Web::AuthController < Web::ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_or_initialize_by(email: auth['info']['email'].downcase)

    user.nickname = auth['info']['nickname']
    user.name = auth['info']['name']
    user.email = auth['info']['email'].downcase
    user.image_url = auth['info']['image']
    user.token = auth['credentials']['token']

    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "#{t('.signed_in')} #{auth['provider']}!"
    else
      redirect_to root_path, alert: t('.sign_in_failed')
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: t('.signed_out').to_s
  end
end
