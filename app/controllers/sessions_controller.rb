class SessionsController < ApplicationController
  layout 'another_layout'

  def user_info_keep
    session[:nickname] = params[:nickname]
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:password_confirmation] = params[:password_confirmation]
    session[:last_name] = params[:last_name]
    session[:first_name] = params[:first_name]
    session[:last_name_kana] = params[:last_name_kana]
    session[:first_name_kana] = params[:first_name_kana]
    session[:birth_year] = params[:birth_year]
    session[:birth_month] = params[:birth_month]
    session[:birth_day] = params[:birth_day]

    redirect_to new_phone_entrypage_path
  end

  def phone_entrypage
  end

  def phone_info_keep
    session[:cell_phone] = params[:cell_phone]

    redirect_to new_address_entrypage_path
  end

  def address_entrypage
  end

  def address_info_keep
    session[:addr_last_name] = params[:addr_last_name]
    session[:addr_first_name] = params[:addr_first_name]
    session[:addr_last_name_kana] = params[:addr_last_name_kana]
    session[:addr_first_name_kana] = params[:addr_first_name_kana]
    session[:postal_code] = params[:postal_code]
    session[:prefecture] = params[:prefecture]
    session[:municipalities] = params[:municipalities]
    session[:address_number] = params[:address_number]
    session[:building] = params[:building]
    session[:addr_cell_phone] = params[:addr_cell_phone]

    User.create!(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      cell_phone: session[:cell_phone]
    )

    user = User.find_by(email: session[:email])
    Address.create(
      last_name: session[:addr_last_name],
      first_name: session[:addr_first_name],
      last_name_kana: session[:addr_last_name_kana],
      first_name_kana: session[:addr_first_name_kana],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      municipalities: session[:municipalities],
      address_number: session[:address_number],
      building: session[:building],
      cell_phone: session[:addr_cell_phone],
      user_id: user.id
    )
    sign_in user

    redirect_to new_credit_entrypage_path
  end

  require "payjp"

  def credit_entrypage
  end

  def register
    Payjp.api_key = "sk_test_543d657d3b55ce90bfcb0bc8"
    if params['payjp-token'].blank?
      redirect_to new_credit_entrypage_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to register_done_path
      else
        redirect_to register_path
      end
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
      redirect_to new_credit_entrypage_path
  end

  def register_done
  end

end
