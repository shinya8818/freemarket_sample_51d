class UsersController < ApplicationController
  before_action :set_user, only: [:listings]
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
  end

  def login
    user = User.find_by(email: params[:email])

    if params[:email].blank? || params[:password].blank?
      # JSで入力チェックエラー表示
    elsif user && user.valid_password?(params[:password])
      sign_in user
      redirect_to root_path
    else
      flash[:need_new_account] = 'メールアドレスまたはパスワードが違います' 
      redirect_to new_user_session_path
      # JSで同値チェックエラー表示
    end
  end

  def logout
  end

  def new
    render layout: 'another_layout'
  end

  def address
  end

  def done
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def new_credit
    @card = current_user.card
  end

  def cardadd
  end

  def listings

  end

  def exhibition
  end

  def identity
    @user = User.find(current_user.id)
  end

  def profile
  end

  private
  def set_user
    @user = User.find(params[id])
  end
end
