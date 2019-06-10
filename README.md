# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users table
|column|type|options|
|------|----|-------|
|family_name         |string  |null: false |
|first_name          |string  |null: false |
|family_kana_name    |string  |null: false |
|first_kana_name     |string  |null: false |
|birthday            |integer  |null: false |
|postal_code         |integer |null: false |
|prefecture          |string  |null: false |
|city                |string  |null: false |
|block               |integer  |null: false |
|building            |string  |
|tel                 |integer  |unique: true |
|credit_card         |integer  |
|image               |string  |
|profile             |text    |
|nickname            |string  |
|item_id             |references  |foreign_key: true |

### Association
- has_many :items
- has_many :reviews
- has_many :messages
- has_many :likes
- has_many :comments
- belongs_to :wallet





## items table
|column|type|options|
|------|----|-------|
|name              |string  |null: false |
|description       |text    |null: false |
|status            |enum    |null: false |
|trade_status      |string  |
|delivery_change   |string  |
|delivery_days     |string  |
|size              |string  |
|price             |integer |null: false |
|category_id       |references |foreign_key:true|
|like_id           |references |foreign_key:true|
|comment_id        |references |foreign_key:true|
|bland_id          |references |foreign_key:true|
|seller_id           |references |foreign_key:true|
|image_id          |references |foreign_key:true|
|region_id         |references |foreign_key:true|
|customer_id       |references |foreign_key:true|
|sales_status      |string |



### association
- has_many :comments
- has_many :images
- belongs_to :category
- belongs_to :bland
- belongs_to :like
- belongs_to :user
- belongs_to :region




## reviews table
|column|type|options|
|------|----|-------|
|rate        |integer  |
|comment     |text  |

### Association
- belongs_to :user

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|text       |text          |null:false    |
|item_id    |references    |foreign_key: true    |


### Association
- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name       |string    | 



### Association
- has_many :items

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id    |references    |foreign_key: true    |
|user_id    |references    |foreign_key: true    |


### Association
- belongs_to :item
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text       |text    |
|item_id    |references    |foreign_key: true    |
|user_id    |references    |foreign_key: true    |

### Association
- belongs_to :item
- belongs_to :user

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text       |text    | 
|user_id    |references    |foreign_key: true    |
|item_id    |references    |foreign_key: true    |

### Association
- belongs_to :user


## regionsテーブル

|Column|Type|Options|
|------|----|-------|
|prefectures    |string    |
|item_id        |references    |foreign_key: true    |

### Association
- has_many :items


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name       |string     | 
|item_id    |references |foreign_key: true    |
|ancestry   |string     |

### Association
- has_many :items

## walletsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id       |references    |foreign_key: true    |
|customer_id   |references    |foreign_key: true    |
|card_id       |references    |foreign_key: true    |

### Association
- belongs_to :user

hello world2
