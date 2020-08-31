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
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_date    | integer | null: false |
| point            | integer | null: false |
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
| stock          | integer    | null: false                     |
| explain        | string     | null: false                     |
| category       | integer    | null: false                     |
| condition      | integer    | null: false                     |
| delivery_payer | integer    | null: false                     |
| region         | integer    | null: false                     |
| delivery_span  | integer    | null: false                     |
| user           | references | null: false, foreign_key: true  |
### Association
- has_many :purchases
- has_many :comments
- has_many :favorites
- belongs_to :user

## purchase テーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| payment_method | string     | null: false                     |
| paid_by_buyer  | boolean    | null: false                     |
| pay_to_seller  | boolean    | null: false                     |
| user           | references | null: false, foreign_key: true  |
| product        | references | null: false, foreign_key: true  |
### Association
- belongs_to :user
- belongs_to :product
- has_one :credit
- has_one :address

## credits テーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| number         | string     | null: false                     |
| limit_month    | integer    | null: false                     |
| limit_year     | integer    | null: false                     |
| security_code  | string     | null: false                     |
| purchase       | references | null: false, foreign_key: true  |
### Association
- belongs_to :purchase

## addresses テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| postal_code      | string     | null: false                     |
| prefecture       | integer    | null: false                     |
| city             | string     | null: false                     |
| city_number      | string     | null: false                     |
| building         | string     | null: false                     |
| telephone_number | string     | null: false                     |
| purchase         | references | null: false, foreign_key: true  |
### Association
- belongs_to :purchase

## comments テーブル
| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| text    | string     | null: false                     |
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