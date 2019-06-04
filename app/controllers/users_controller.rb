class UsersController < ApplicationController

  def index
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    sign_in user
    redirect_to root_path
  end

  def logout
  end

  def new
  end

  def address
  end

  def done
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

end
