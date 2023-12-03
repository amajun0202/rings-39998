# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |
| introduce          | text   | null: false               |

### Association

- has_many :locations
- has_many :likes
- has_many :comments

## locations テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| estimated_time     | string     | null: false                    |
| meal_enter_id      | integer    | null: false                    |
| max_cost           | integer    | null: false                    |
| min_cost           | integer    | null: false                    |
| description        | text       | null: false                    |
| address            | text       | null: false, unique: true      |
| phone_number       | string     |                                |
| nearest_station    | string     |                                |
| travel_time        | integer    |                                |
| business_hours     | string     | null: false                    |
| official_url       | string     |                                |
| requires_id        | integer    | null: false                    |
| user               | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- has_many :likes
- has_many :comments


## likes テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false , foreign_key: true|
| location           | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :location


## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false , foreign_key: true|
| location           | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :location
- has_one :rating


## ratings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| comment            | references | null: false , foreign_key: true|

### Association

- belongs_to :comment