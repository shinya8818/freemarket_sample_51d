class SessionsController < ApplicationController

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

    redirect_to new_credit_entrypage_path
  end

  def credit_entrypage
  end

  def register
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
    
    redirect_to new_register_done_path
  end

  def register_done
  end

end
