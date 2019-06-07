## usersテーブル

|Column|Type|Options|
|------|----|-------|
|Nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|sex|string||
|last_name|string|null: false|
|first_name|string|null: false|
|last_name(kana)|string|null: false|
|first_name(kana)|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|cell_phone|string|null: false,unique: true|
|avatar|string||
|profile|text||

### Association
has_one :adress  
has_many :likes  
has_many :comments  
has_many :items  
has_many :sns_credentials  

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|text|null: false|
|municipalities|string|null: false|
|address_number|string|null: false|
|building|string||
|cell_phone|string|
|user_id|references|null: false,foreign_key: true|

### Association
belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false,foreign_key: true|
|user_id|references|null: false,foreign_key: true|

### Association
belongs_to :user  
belongs_to :item

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|item_id|references|null: false,false,foreign_key: true|
|user_id|references|null: false,false,foreign_key: true|

### Association
belongs_to :user  
belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|brand|string||
|status|integer|null: false|
|fee|integer|null: false|
|condition|integer|null: false|
|delivery|integer|null: false|
|prefecture|string|null: false|
|days|integer|null: false|
|user_id|references|null: false,foreign_key: true|
|size|string||
|shipping_fee|integer|null: false|
|category_id|references|null: false,foreign_key: true|

### Association
belongs_to :user  
belongs_to :category  
has_many :categories  
has_many :images  
has_many :comments  
has_many :likes  

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false,foreign_key: true|

### Association
belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :items
has_ancestry

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|uid|string|null:false,unique: true|
|provider|string|null:false|
|user_id|references|null:false,foreign_key: true|

### Association
belongs_to :user
