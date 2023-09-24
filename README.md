# テーブル設計
## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | -------| ------------------------- |
| name                | string | NULL: false               |
| email               | string | NULL: false, unique: true |
| encrypted_password  | string | NULL: false               |
| address             | text   | NULL: false               |
  credit

## Assosiation
- has_many :item_users
- has_one :buyers

## itemsテーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------  |
| item       | text       | NULL:false                    |
| category   | text       | NULL:false                    |
| price      | integer    | NULL:false                    |
| user       | references | NULL:false, foreign_key: true |
  image

## Assosiation
- belongs_to :users
- belongs_to :buyers

## buyersテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| item    | text       | NULL:false, foreign_key: true |
| user    | references | NULL:false, foreign_key: true |

## Assosiation
- has_many :item_users
- has_one :users
