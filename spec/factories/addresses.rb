FactoryBot.define do
  factory :address do
    last_name             { "第一" }
    first_name            { "太郎" }
    last_name_kana        { "ダイイチ" }
    first_name_kana       { "タロウ" }
    postal_code           { "111-1111" }
    prefecture            { "北海道" }
    municipalities        { "テスト" }
    address_number        { "1-1" }
  end
end
