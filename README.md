# DB 設計

## users テーブル

| Column             | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_kana         | string              | null: false             |
| last_kana          | string              | null: false             |
| birth_year         | integer             | null: false             |
| birth_month        | integer             | null: false             |
| birth_day          | integer             | null: false             |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## sending_destinations テーブル

| Column             | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| approval_code      | string              | null: false             |
| expiration_date    | string              | null: false             |
| security_code      | string              | null: false             |
| post_code          | string              | null: false             |
| prefecture         | string              | null: false             |
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
| category           | integer             | null: false             |
| item_condition     | integer             | null: false             |
| postage_payer      | integer             | null: false             |
| prefecture         | integer             | null: false             |
| preparation_day    | integer             | null: false             |
| price              | integer             | null: false             |
| image              | integer             | null: false             |
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
- has_one    :sending_destinations