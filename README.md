# テーブル設計
## Usersテーブル
| Column              | Type   | Options                   |
| ------------------- | -------| ------------------------- |
| name                | string | NULL: false               |
| email               | string | NULL: false, unique: true |
| encrypted_password  | string | NULL: false               |
| address             | text   | NULL: false               |

## Assosiation
- has_many :item_users
- has_one :orders

## Itemsテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ----------------------------   |
| item_name  | text       | NULL: false                    |
| category   | text       | NULL: false                    |
| detail     | text       | NULL: false                    |
| quality    | text       | NULL: false                    |
| explain    | text       | NULL: false                    |
| price      | integer    | NULL: false                    |
| user       | references | NULL: false, foreign_key: true |
## Assosiation
- belongs_to :users
- belongs_to :addresses

## Addressesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | -----------------------------  |
| oder    | references | NULL: false, foreign_key: true |
| item    | references | NULL: false, foreign_key: true |
| address | text       | NULL: false                    |
## Assosiation
- has_many :items
- has_one :orders

## ordersテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | NULL:false, foreign_key: true |
| address | references | NULL:false, foreign_key: true |
## Assosiation
- has_one :users
- has_one :address
