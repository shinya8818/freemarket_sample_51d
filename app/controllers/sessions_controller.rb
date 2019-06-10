class SessionsController < Devise::SessionsController
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
  test = User.new(nickname: session[:nickname])

    if session[:nickname].blank? || 
       session[:email].blank? || 
       session[:password].blank? ||
       session[:password_confirmation].blank? ||
       session[:last_name].blank? ||
       session[:first_name].blank? ||
       session[:last_name_kana].blank? ||
       session[:first_name_kana].blank? ||
       session[:birth_year].blank? ||
       session[:birth_month].blank? ||
       session[:birth_day].blank?
       # JSで入力エラー表示
    else
      redirect_to new_phone_entrypage_path
    end
  end

  def phone_entrypage
  end

  def phone_info_keep
    session[:cell_phone] = params[:cell_phone]
    if session[:cell_phone].blank?
      # JSで入力エラー表示      
    else
      redirect_to new_address_entrypage_path
    end
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

    redirect_to new_card_path
  end

  def credit_entrypage
  end

  def register
    redirect_to new_register_done_path
  end

  def register_done
  end

end
