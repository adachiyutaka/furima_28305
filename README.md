# テーブル設計

## users テーブル
| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| nickname       | string    | null: false |
| email          | string    | null: false |
| first_name     | string    | null: false |
| last_name      | string    | null: false |
| last_name_kana | string    | null: false |
| first_name_kana| string    | null: false |
| password       | string    | null: false |
| birthday       | date      | null: false |

### Association
- has_many :items, dependent: :destroy
- has_many :item_orders, dependent: :destroy

## items テーブル
| Column             | Type      | Options    |
| ------------------ | --------- | ---------- |
| name               | string    | null:false |
| text               | text      | null:false |
| category           | integer   | null:false |
| condition          | integer   | null:false |
| including_postage  | integer   | null:false |
| consignor_location | integer   | null:false |
| ready_time         | integer   | null:false |
| price              | integer   | null:false |
| user_id            | references| null:false, foreign_key: true |

### Association
- has_one :item_order, dependent: :destroy
- belongs_to :user

## item_orders テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| user_id        | references| null: false, foreign_key: true |
| item_id        | references| null: false, foreign_key: true |

### Association
- has_one :address, dependent: :destroy
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| postal_code    | string    | null:false  |
| prefecture     | integer   | null:false |
| city           | string    | null:false |
| house_number   | string    | null:false |
| building_name  | string    |            |
| phone number   | string    | null:false |
| item_order_id  | references| null: false, foreign_key: true |

### Association
- belongs_to :item-order-id