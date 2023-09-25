# テーブル設計
## Usersテーブル
| Column              | Type   | Options                   |
| ------------------- | -------| ------------------------- |
| nickname            | string | NULL: false               |
| email               | string | NULL: false, unique: true |
| encrypted_password  | string | NULL: false               |
| kanji_sei           | string | NULL: false               |
| kanji_mei           | string | NULL: false               |
| kana_sei            | string | NULL: false               |
| kana_mei            | string | NULL: false               |
| birthday            | date   | NULL: false               |
## Assosiation
- has_many :items
- has_many :orders

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
| user         | references | NULL: false, foreign_key: true |
## Assosiation
- belongs_to :user
- has_one :order

## Addressesテーブル
| Column         | Type       | Options                        |
| -------        | ---------- | -----------------------------  |
| oder           | references | NULL: false, foreign_key: true |
| postal_code    | string     | NULL: false                    |
| prefecture_id  | integer    | NULL: false                    |
| city           | string     | NULL: false                    |
| address        | string     | NULL: false                    |
| building       | string     |                                |
| phone_number   | string     | NULL: false                    |
## Assosiation
- belongs_to :order

## ordersテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | NULL:false, foreign_key: true |
| item    | references | NULL:false, foreign_key: true |
## Assosiation
- belongs_to :user
- belongs_to :item
- has_one :address