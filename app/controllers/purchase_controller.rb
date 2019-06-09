class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @item = Item.find(params[:id])
    @images = @item.images
    @users = @item.user
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to root_path
    else
      Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
    Payjp::Charge.create(
    :amount => @item.fee,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

end
