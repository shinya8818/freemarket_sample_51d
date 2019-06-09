class CardController < ApplicationController
  require "payjp"

  def new
  end

  def pay
    Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to new_register_done_path
      else
        redirect_to action: "pay"
      end
    end
  end
end
