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

mens_accessory.create([{name:"ネックレス"},{name:"時計"},{name:"帽子"},{name:"その他"}])

baby = Category.create(name: "ベビー・キッズ")

baby_baby = baby.children.create(name: "ベビー服")
baby_kids = baby.children.create(name: "キッズ服")
baby_accessory = baby.children.create(name: "アクセサリー")

baby_baby.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"その他"}])
baby_kids.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"その他"}])
baby_accessory.children.create([{name:"靴"},{name:"帽子"},{name:"おむつ"},{name:"その他"}])

interior = Category.create(name: "インテリア・住まい・小物")

book = Category.create(name: "本・音楽・ゲーム")

book.book = book.create(name: "本")
book.music = book.create(name: "音楽")
book.game = book.create(name: "ゲーム")

book.book.children.create([{name:"本"},{name:"漫画"},{name:"雑誌"},{name:"その他"}])
book.music.children.create([{name:"CD"},{name:"DVD"},{name:"レコード"},{name:"その他"}])
book.game.children.create([{name:"ゲーム機本体"},{name:"ゲームソフト"},{name:"PCゲーム"},{name:"その他"}])

toy = Category.create(name: "おもちゃ・ホビー・グッズ")

cosmetics = Category.create(name: "コスメ・香水・美容")

appliance = Category.create(name: "家電・スマホ・カメラ")

sports = Category.create(name: "スポーツ・レジャー")

sports.golf = sports.create(name: "ゴルフ")
sports.baseball = sports.create(name: "野球")
sports.other = sports.create(name: "その他スポーツ")

sports.golf.create([{name:"クラブ"},{name:"ウェア"},{name:"シューズ"},{name:"その他"}])
sports.baseball.create([{name:"ウェア"},{name:"グローブ"},{name:"アクセサリー"},{name:"その他"}])
sports.other.create([{name:"ウェア"},{name:"シューズ"},{name:"アクセサリー"},{name:"その他"}])

handmade = Category.create(name: "ハンドメイド")

handmade.accessory = handmade.create(name: "アクセサリー")
handmade.fashion = handmade.create(name: "ファッション")
handmade.interior = handmade.create(name: "インテイリア")

handmade.accessory.create([{name:"ピアス"},{name:"リング"},{name:"ネックレス"},{name:"その他"}])
handmade.fashion.create([{name:"バッグ"},{name:"財布"},{name:"雑貨"},{name:"その他"}])
handmade.interior.create([{name:"キッチン"},{name:"家具"},{name:"文房具"},{name:"その他"}])

ticket = Category.create(name: "チケット")

ticket.sports = ticket.create(name: "スポーツ")
ticket.entertainment = ticket.create(name: "イベント")
ticket.other = ticket.create(name: "その他")

ticket.sports.create([{name:"サッカー"},{name:"野球"},{name:"テニス"},{name:"その他"}])
ticket.entertainment.create([{name:"音楽"},{name:"演劇"},{name:"芸能"},{name:"その他"}])
ticket.other.create([{name:"映画"},{name:"優待券"},{name:"施設利用券"},{name:"その他"}])

bicycle = Category.create(name: "自転車・オートバイ")

bicycle.bicycle = bicycle.create(name: "自転車")
bicycle.motorcycle = bicycle.create(name: "オートバイ")

bicycle.bicycle.create([{name:"本体"},{name:"タイヤ/ホイール"},{name:"パーツ"},{name:"その他"}])
bicycle.motorcycle.create([{name:"本体"},{name:"タイヤ/ホイール"},{name:"パーツ"},{name:"その他"}])

other = Category.create(name: "その他")
