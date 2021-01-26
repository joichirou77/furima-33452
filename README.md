# DB 設計

## users テーブル

| Column             | Type                | Options                   |
| ------------------ | ------------------- | ------------------------- |
| nickname           | string              | null: false               |
| email              | string              | null: false ,unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_kana         | string              | null: false               |
| last_kana          | string              | null: false               |
| birthday           | date                | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## addressesテーブル

| Column             | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| post_code          | string              | null: false             |
| prefecture_id      | string              | null: false             |
| city               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |
| order              | references          | foreign_key: true       |

### Association

- belongs_to :order

## items テーブル

| Column             | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| name               | string              | null: false             |
| item_description   | text                | null: false             |
| category_id        | integer             | null: false             |
| condition_id       | integer             | null: false             |
| postage_payer_id   | integer             | null: false             |
| prefecture_id      | integer             | null: false             |
| preparation_day_id | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | foreign_key: true       |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :order

## comments テーブル

| Column             | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| text               | text                | null: false             |
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

- belongs_to :user
- belongs_to :item

## order テーブル

| Column             | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address