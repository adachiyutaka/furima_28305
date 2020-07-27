# テーブル設計

## users テーブル
| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| nickname       | string    | null: false |
| first_name     | string    | null: false |
| last_name_kana | string    | null: false |
| first_name_kana| string    | null: false |
| password       | string    | null: false |
| birthday       | date      | null: false |

### Association
- has_many :items, dependent: :destroy
- has_one :card, dependent: :destroy

## items テーブル
| Column             | Type      | Options    |
| ------------------ | --------- | ---------- |
| name               | string    | null:false |
| text               | text      | null:false |
| category           | integer   | null:false |
| condition          | integer   | null:false |
| including_postage  | boolean   | null:false |
| consignor_location | integer   | null:false |
| ready_time         | integer   | null:false |
| price              | integer   | null:false |
| user_id            | references| null:false, foreign_key: true |

### Association
- has_one :item_order, dependent: :destroy
- belongs_to :user

## cards テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| card_token     | integer   | null: false |
| customer_token | integer   | null: false |
| user-id        | references| null: false, foreign_key: true |

### Association
- belongs_to :user

## item_orders テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| item-id        | references| null: false, foreign_key: true |

### Association
- belongs_to :item