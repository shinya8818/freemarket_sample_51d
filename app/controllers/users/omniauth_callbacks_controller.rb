class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook) #コールバック
  end

  def google_oauth2
    callback_for(:google) #コールバック
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"]) #userモデルに飛ぶ

    if @user[:sns].present?
      # SNS経由で会員登録済
      sign_in_and_redirect @user[:user][0]
    else
      # SNS経由で会員登録未済 
      @test = @user[:user][:nickname]
      session[:uid] = @user[:uid]
      session[:provider] = @user[:provider]
      redirect_to new_user_registration_path
    end
  end
end