class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"]) #userモデルに飛ぶ

    if @user[:sns].present?
      # SNS経由で会員登録済
      sign_in_and_redirect @user[:user][0]
    else
      # SNS経由で会員登録未済 
      flash[:nickname] = @user[:user][:nickname]
      flash[:email] = @user[:user][:email]
      flash[:sns] = "have_password_with_sns"
      password_token = Devise.friendly_token.first(10) #deviseのパスワード自動生成機能を使用
      session[:password] = password_token 
      session[:password_confirmation] = password_token
      session[:uid] = @user[:uid]
      session[:provider] = @user[:provider]
      redirect_to new_user_registration_path
    end
  end
end