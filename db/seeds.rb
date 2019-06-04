# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lady = Category.create(name: "レディース")

lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skirt = lady.children.create(name: "スカート")
lady_one_piece = lady.children.create(name: "ワンピース")
lady_shoes = lady.children.create(name: "靴")
lady_room_wear = lady.children.create(name: "ルームウェア/パジャマ")
lady_leg_wear = lady.children.create(name: "レッグウェア")
lady_hat = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accessories = lady.children.create(name: "アクセサリー")
lady_hair_accessory = lady.children.create(name: "ヘアアクセサリー")
lady_accessory = lady.children.create(name: "小物")
lady_clock = lady.children.create(name: "時計")

lady_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"},{name:"Tシャツ/カットソー(七分/長袖)"},{name:"シャツ/ブラウス(半袖/袖なし)"},{name:"シャツ/ブラウス (七分/長袖)"},{name:"ポロシャツ"},{name:"キャミソール"},{name:"タンクトップ"},{name:"ホルターネック"},{name:"ニット/セーター"},{name:"チュニック"},{name:"カーディガン/ボレロ"},{name:"アンサンブル"},{name:"ベスト/ジレ"},{name:"パーカー"}])

lady_jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])

mens = Category.create(name: "メンズ")

mens_wear = mens.children.create(name: "ウェア")
mens_shoes = mens.children.create(name: "シューズ")
mens_accessory = mens.children.create(name: "アクセサリー")

mens_wear.children.create([{name:"トップス"},{name:"アウター"},{name:"ボトムス"},{name:"その他"}])

mens_shoes.children.create([{name:"スニーカー"},{name:"サンダル"},{name:"ブーツ"},{name:"その他"}])

mens_accessory.children.create([{name:"ネックレス"},{name:"時計"},{name:"帽子"},{name:"その他"}])

baby = Category.create(name: "ベビー・キッズ")

baby_baby = baby.children.create(name: "ベビー服")
baby_kids = baby.children.create(name: "キッズ服")
baby_accessory = baby.children.create(name: "アクセサリー")

baby_baby.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"その他"}])
baby_kids.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"その他"}])
baby_accessory.children.create([{name:"靴"},{name:"帽子"},{name:"おむつ"},{name:"その他"}])

interior = Category.create(name: "インテリア・住まい・小物")

interior_interior = interior.children.create(name: "インテリア")
interior_house = interior.children.create(name: "住まい")
interior_furniture = interior.children.create(name: "家具")

interior_interior.children.create([{name:"ライト/照明"},{name:"カーペット"},{name:"カーテン"},{name:"その他"}])
interior_house.children.create([{name:"キッチン"},{name:"収納"},{name:"小物"},{name:"その他"}])
interior_furniture.children.create([{name:"椅子"},{name:"ソファ"},{name:"ベッド"},{name:"その他"}])

book = Category.create(name: "本・音楽・ゲーム")

book_book = book.children.create(name: "本")
book_music = book.children.create(name: "音楽")
book_game = book.children.create(name: "ゲーム")

book_book.children.create([{name:"本"},{name:"漫画"},{name:"雑誌"},{name:"その他"}])
book_music.children.create([{name:"CD"},{name:"DVD"},{name:"レコード"},{name:"その他"}])
book_game.children.create([{name:"ゲーム機本体"},{name:"ゲームソフト"},{name:"PCゲーム"},{name:"その他"}])

toy = Category.create(name: "おもちゃ・ホビー・グッズ")

toy_toy = toy.children.create(name: "おもちゃ")
toy_goods = toy.children.create(name: "グッズ")
toy_collection = toy.children.create(name: "コレクション")

toy_toy.children.create([{name:"キャラクターグッズ"},{name:"ぬいぐるみ"},{name:"カード"},{name:"その他"}])
toy_goods.children.create([{name:"アイドル"},{name:"ミュージシャン"},{name:"タレント"},{name:"その他"}])
toy_collection.children.create([{name:"楽器"},{name:"ミリタリー"},{name:"美術品"},{name:"その他"}])

cosmetics = Category.create(name: "コスメ・香水・美容")

cosmetics_cosmetics = cosmetics.children.create(name: "コスメ")
cosmetics_perfume = cosmetics.children.create(name: "香水")
cosmetics_beatuty = cosmetics.children.create(name: "美容")

cosmetics_cosmetics.children.create([{name:"ベースメイク"},{name:"メイクアップ"},{name:"ネイルケア"},{name:"その他"}])
cosmetics_perfume.children.create([{name:"男性用"},{name:"女性用"},{name:"ユニセックス"},{name:"その他"}])
cosmetics_beatuty.children.create([{name:"スキンケア"},{name:"ヘアケア"},{name:"ボディケア"},{name:"その他"}])

appliance = Category.create(name: "家電・スマホ・カメラ")

appliance_phone = appliance.children.create(name: "スマートフォン")
appliance_pc = appliance.children.create(name: "タブレット/PC")
appliance_camera = appliance.children.create(name: "カメラ")

appliance_phone.children.create([{name:"スマートフォン本体"},{name:"バッテリー"},{name:"アクセサリー"},{name:"その他"}])
appliance_pc.children.create([{name:"タブレット"},{name:"ノートPC"},{name:"デスクトップ型PC"},{name:"その他"}])
appliance_camera.children.create([{name:"デジタルカメラ"},{name:"ビデオカメラ"},{name:"レンズ"},{name:"その他"}])

sports = Category.create(name: "スポーツ・レジャー")

sports_golf = sports.children.create(name: "ゴルフ")
sports_baseball = sports.children.create(name: "野球")
sports_other = sports.children.create(name: "その他スポーツ")

sports_golf.children.create([{name:"クラブ"},{name:"ウェア"},{name:"シューズ"},{name:"その他"}])
sports_baseball.children.create([{name:"ウェア"},{name:"グローブ"},{name:"アクセサリー"},{name:"その他"}])
sports_other.children.create([{name:"ウェア"},{name:"シューズ"},{name:"アクセサリー"},{name:"その他"}])

handmade = Category.create(name: "ハンドメイド")

handmade_accessory = handmade.children.create(name: "アクセサリー")
handmade_fashion = handmade.children.create(name: "ファッション")
handmade_interior = handmade.children.create(name: "インテイリア")

handmade_accessory.children.create([{name:"ピアス"},{name:"リング"},{name:"ネックレス"},{name:"その他"}])
handmade_fashion.children.create([{name:"バッグ"},{name:"財布"},{name:"雑貨"},{name:"その他"}])
handmade_interior.children.create([{name:"キッチン"},{name:"家具"},{name:"文房具"},{name:"その他"}])

ticket = Category.create(name: "チケット")

ticket_sports = ticket.children.create(name: "スポーツ")
ticket_entertainment = ticket.children.create(name: "イベント")
ticket_other = ticket.children.create(name: "その他")

ticket_sports.children.create([{name:"サッカー"},{name:"野球"},{name:"テニス"},{name:"その他"}])
ticket_entertainment.children.create([{name:"音楽"},{name:"演劇"},{name:"芸能"},{name:"その他"}])
ticket_other.children.create([{name:"映画"},{name:"優待券"},{name:"施設利用券"},{name:"その他"}])

bicycle = Category.create(name: "自転車・オートバイ")

bicycle_bicycle = bicycle.children.create(name: "自転車")
bicycle_motorcycle = bicycle.children.create(name: "オートバイ")

bicycle_bicycle.children.create([{name:"本体"},{name:"タイヤ/ホイール"},{name:"パーツ"},{name:"その他"}])
bicycle_motorcycle.children.create([{name:"本体"},{name:"タイヤ/ホイール"},{name:"パーツ"},{name:"その他"}])

other = Category.create(name: "その他")

other_pet = other.children.create(name: "ペット用品")
other_food = other.children.create(name: "飲食")
other_office = other.children.create(name: "事務用品")

other_pet.children.create([{name:"ペットフード"},{name:"猫、犬用品"},{name:"魚用品"},{name:"その他"}])
other_food.children.create([{name:"食品"},{name:"飲料"},{name:"酒"},{name:"その他"}])
other_office.children.create([{name:"文房具"},{name:"オフィス用品"},{name:"店舗用品"},{name:"その他"}])
