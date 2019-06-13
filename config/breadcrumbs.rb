#メルカリ＞マイページ＞支払い方法＞クレジットカード情報入力
crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :card do
  link "支払い方法", new_credit_path
  parent :users
end

crumb :cardadd do
  link "クレジットカード情報入力", cardadd_path
  parent :card
end

crumb :exhibition do
  link "出品した商品 - 出品中", exhibition_path
  parent :users
end
