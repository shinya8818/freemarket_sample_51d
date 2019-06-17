#メルカリ＞マイページ＞支払い方法＞クレジットカード情報入力
crumb :root do
  link "メルカリ", root_path
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end


crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :card do
  link "支払い方法", card_users_path, method: :post
  parent :users
end

crumb :cardadd do
  link "クレジットカード情報入力", cardedd_users_path
  parent :card
end

crumb :exhibition do
  link "出品した商品 - 出品中", exhibition_path
  parent :users
end

crumb :complete do
  link "出品した商品 - 売却済み", complete_path
  parent :users
end

crumb :identity do
  link "本人情報の登録", identity_path
  parent :users
end

crumb :profile do
  link "プロフィール", profile_path
  parent :users
end

crumb :item do |item|
  link "#{item.name}", item_path
  parent :root
end
