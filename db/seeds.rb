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

lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

mens = Category.create(name: "メンズ")

baby = Category.create(name: "ベビー・キッズ")

interior = Category.create(name: "インテリア・住まい・小物")

book = Category.create(name: "本・音楽・ゲーム")

toy = Category.create(name: "おもちゃ・ホビー・グッズ")

cosmetics = Category.create(name: "コスメ・香水・美容")

appliance = Category.create(name: "家電・スマホ・カメラ")

sports = Category.create(name: "スポーツ・レジャー")

handmade = Category.create(name: "ハンドメイド")

ticket = Category.create(name: "チケット")

bicycle = Category.create(name: "自転車・オートバイ")

other = Category.create(name: "その他")
