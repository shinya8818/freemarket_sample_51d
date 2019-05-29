## usersテーブル

|Column|Type|Options|
|------|----|-------|
|Nickname|text|null: false|
|email|text|null: false,unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|sex|text||
|last_name|text|null: false|
|first_name|text|null: false|
|last_name(kana)|text|null: false|
|first_name(kana)|text|null: false|
|birth_year|text|null: false|
|birth_month|text|null: false|
|birth_day|text|null: false|
|cell_phone|text|null: false,unique: true|
|avatar|text||
|profile|text||

### Association
has_many :adresses  
has_many :creadits  
has_many :likes  
has_many :comments  
has_many :items  
has_many :sns_credentials  

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|text|null: false|
|municipalities|text|null: false|
|address_number|integer|null: false|
|building|text||
|user_id|references|null: false,foreign_key: true|

### Association
belongs_to :user

## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|security|text|null: false|
|deadline_year|integer|null: false|
|deadline_month|integer|null: false|
|user_id|references|null :false,foreign_key: true|

### Association
belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false,foreign_key: true|
|user_id|references|null: false,foreign_key: true|

### Association
belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|references|null: false,false,foreign_key: true|
|user_id|references|null: false,false,foreign_key: true|

### Association
belongs_to :user  
belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|description|string|null: false|
|brand|text||
|status|integer|null: false|
|fee|integer|null: false|
|condition|integer|null: false|
|method|text|null: false|
|prefecture|text|null: false|
|days|integer|null: false|
|user_id|references|null: false、foreign_key: true|

### Association
belongs_to :user  
has_many :categorys  
has_many :images  
has_many :comments  
has_many :likes  

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false、foreign_key: true|

### Association
belongs_to :item

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|references|null: false、foreign_key: true|

### Association
belongs_to :item

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|uid|string|null:false,unique:ture|
|provider|string|null:false|
|user_id|references|null:fase,foreign_key: true|

### Association
belongs_to :user