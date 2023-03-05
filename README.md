# テーブル設計


## usersテーブル

| Column             | Type    | Option                        |
|--------------------|---------|-------------------------------|
| email              | string  | null: false, uniqueness: true |
| encrypted_password | string  | null: false                   |
| nickname           | string  | null: false                   |
| first_name         | string  | null: false                   |
| last_name          | string  | null: false                   |
| kana_first_name    | string  | null: false                   |
| kana_last_name     | string  | null: false                   |
| birthday           | date    | null: false                   |

### Association
has_many :products
has_many :purchase_records



## productsテーブル

| Column              | Type       | Option                         |
|-------------------- |------------|--------------------------------|
| name                | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_ship_id        | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :purchase_record



## purchase_recordsテーブル

| Column        | Type       | Option                         |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product
has_one    :shipping_info



## shipping_infosテーブル

| Column          | Type       | Option                            |
|-----------------|------------|-----------------------------------|
| post_code       | integer    | null: false                       |
| prefecture_id   | string     | null: false                       |
| city            | string     | null: false                       |
| address_num     | string     | null: false                       |
| buiding_name    | string     |                                   |
| phone_num       | string     | null: false                       |
| purchase_record | references | null: false, foreign_key: true    |

### Association
belongs_to :purchase_record

