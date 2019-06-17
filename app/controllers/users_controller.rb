class UsersController < ApplicationController
  require "payjp"
  before_action :set_user, only: [:listings]

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

  def cardadd
    card = Card.where(user_id: current_user.id)
  end

  def listings
  end

  def pay
    Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
    if params['payjp-token'].blank?
      redirect_to card_new_users_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to users_path
      else
        redirect_to pay_users_path
      end
    end
  end

  def exhibition
  end

  def  card
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to  card_new_users_path
    else
      Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to card_new_users_path
  end

  def  card_new
  end

  private
  def set_user
    @user = User.find(params[id])
  end

end
