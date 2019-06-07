class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    sign_in user
    redirect_to root_path
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

  def card
  end

  def cardadd
  end

end
