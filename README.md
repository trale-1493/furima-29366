# README

## users テーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_cana | string  | null: false |
| first_name_cana  | string  | null: false |
| birthday         | date    | null: false |
### Association
- has_many :products
- has_many :purchases
- has_many :comments
- has_many :favorites

## products テーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| name           | string     | null: false                     |
| image          | string     | null: false                     |
| value          | integer    | null: false                     |
| explain        | text       | null: false                     |
| category       | integer    | null: false                     |
| condition      | integer    | null: false                     |
| delivery_payer | integer    | null: false                     |
| region         | integer    | null: false                     |
| delivery_span  | integer    | null: false                     |
| user           | references | null: false, foreign_key: true  |
### Association
- belongs_to :user
- has_one :purchase
- has_many :comments
- has_many :favorites

## purchases テーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false, foreign_key: true  |
| product        | references | null: false, foreign_key: true  |
### Association
- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| postal_code      | string     | null: false                     |
| prefecture       | integer    | null: false                     |
| city             | string     | null: false                     |
| city_number      | string     | null: false                     |
| building         | string     |                                 |
| telephone_number | string     | null: false                     |
| purchase         | references | null: false, foreign_key: true  |
### Association
- belongs_to :purchase

## comments テーブル
| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| content | text       | null: false                     |
| user    | references | null: false, foreign_key: true  |
| product | references | null: false, foreign_key: true  |
### Association
- belongs_to :user
- belongs_to :product

## favorites テーブル
| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| user    | references | null: false, foreign_key: true  |
| product | references | null: false, foreign_key: true  |
### Association
- belongs_to :user
- belongs_to :product