# テーブル設計
## usersテーブル
| Column              | Type   | Options                   |
| ------------------- | -------| ------------------------- |
| name                | string | NULL: false               |
| email               | string | NULL: false, unique: true |
| encrypted_password  | string | NULL: false               |
| address             | text   | NULL: false               |

## Assosiation
- has_many :item_users
- has_one :buyers

## itemsテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ----------------------------   |
| item       | text       | NULL: false                    |
| category   | text       | NULL: false                    |
| price      | integer    | NULL: false                    |
| user       | references | NULL: false, foreign_key: true |
  image

## Assosiation
- belongs_to :users
- belongs_to :recieves

## buyersテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | -----------------------------  |
| user    | references | NULL: false, foreign_key: true |
| recieve | references | NULL: false, foreign_key: true |

## Assosiation
- has_many :item_users
- has_one :users
- has_one :recieve

## recievesテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| item    | text       | NULL:false, foreign_key: true |
| buyer   | references | NULL:false, foreign_key: true |
| address | references | NULL:false                    |
## Assosiation
- has_many :item_users
- has_one :users
- has_one :buyer
