# テーブル設計
## Usersテーブル
| Column              | Type   | Options                   |
| ------------------- | -------| ------------------------- |
| nickname            | string | NULL: false               |
| email               | string | NULL: false, unique: true |
| encrypted_password  | string | NULL: false               |
| name_kanji          | string | NULL: false               |
| name_kana           | string | NULL: false               |
| birth_year          | integer| NULL: false               |
| birth_month         | integer| NULL: false               |
| birth_day           | integer| NULL: false               |
## Assosiation
- has_many :item
- has_one :orders

## Itemsテーブル
| Column       | Type       | Options                        |
| ----------   | ---------- | ----------------------------   |
| item_name    | string     | NULL: false                    |
| explain      | text       | NULL: false                    |
| category_id  | integer    | NULL: false                    |
| quality_id   | integer    | NULL: false                    |
| fee_status_id| integer    | NULL: false                    |
| prefecture_id| integer    | NULL: false                    |
| scheduled_id | integer    | NULL: false                    |
| price        | integer    | NULL: false                    |
| add_tax_id   | integer    | NULL: false                    |
| profit_id    | integer    | NULL: false                    |
| user         | references | NULL: false, foreign_key: true |
## Assosiation
- belongs_to :users
- has_many :address_orders

## Addressesテーブル
| Column         | Type       | Options                        |
| -------        | ---------- | -----------------------------  |
| oder           | references | NULL: false, foreign_key: true |
| item           | references | NULL: false, foreign_key: true |
| postal_code_id | integer    | NULL: false                    |
| prefecture_id  | integer    | NULL: false                    |
| city           | string     | NULL: false                    |
| address        | string     | NULL: false                    |
| building       | string     | NULL: false                    |
| phone_number   | integer    | NULL: false                    |
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
- belongs_to :address
