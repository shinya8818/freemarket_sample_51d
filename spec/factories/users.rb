FactoryBot.define do
  factory :user do
    nickname               { "taro" }
    sequence(:email)       { Faker::Internet.email }
    password               { "000000" }
    password_confirmation	 { "000000" }
    sex                    { "男" }
    last_name              { "山田" }
    first_name             { "太郎" }
    last_name_kana         { "ヤマダ" }
    first_name_kana        { "タロウ" }
    birth_year             { 1990 }
    birth_month            { 1 }
    birth_day              { 1 }
    sequence(:cell_phone)  { Faker::PhoneNumber.cell_phone }
    avatar                 { "aaa" }
    profile                { "こんにちは" }
  end
end
