FactoryBot.define do
  factory :item do
    name          { "item" }
    description   { "オススメ" }
    brand         { "UNIQLO" }
    status        { 1 }
    fee           { 100 }
    condition     { 1 }
    delivery      { 1 }
    prefecture    { "東京都" }
    days          { 1 }
    user_id       { 1 }
    size          { "S" } 
    shipping_fee  { 1 }
  end
end
