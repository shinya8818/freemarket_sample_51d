|Column|Type|Options|
|------|----|-------|
|Nickname|text|null: false|
|email|text|null: false|
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
|cell_phone|text|null: false|
|avatar|text||
|profile|text||


### Association
<!-- - has_many :messages
- has_many :users_groups
- has_many :groups, through: users_groups -->

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|text|null: false|
|municipalities|text|null: false|
|address_number|integer|null: false|
|building|text|null: false|

### Association
<!-- - has_many :messages
- has_many :users_groups
- has_many :users, through: users_groups -->

## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|security|text|null: false|
|deadline_year|integer|null: false|
|deadline_month|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|user_id|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|integer|null: false|
|user_id|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

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

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## evaluationテーブル

|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|message|string|null: false|
|to_user|text|null: false|
|item_id|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## pointテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|point|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->

## moneyテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|money|integer|null: false|

### Association
<!-- - belongs_to :group
- belongs_to :user -->
