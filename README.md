# テーブル設計


## usersテーブル

| Column             | Type    | Option                        |
|--------------------|---------|-------------------------------|
| email              | string  | null: false, uniqueness: true |
| encrypted_password | string  | null: false                   |
| nickname           | string  | null: false                   |
| first_name         | string  | null: false                   |
| last_name          | string  | null: false                   |
| birthday           | integer | null: false                   |

### Association
has_many :products
has_many :purchase_records



## productテーブル

| Column              | Type    | Option                            |
|-------------------- |---------|-----------------------------------|
| name                | string  | null: false                       |
| product_description | text    | null: false                       |
| category            | string  | null: false                       |
| condition           | string  | null: false                       |
| shipping_charges    | string  | null: false                       |
| region              | string  | null: false                       |
| days_ship           | string  | null: false                       |
| price               | integer | null: false                       |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :purchase_record



## purchase_recordテーブル

| Column        | Type       | Option                         |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |
| shipping_info | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product
has_one    :shipping_info



## shipping_infoテーブル

| Column       | Type       | Option                            |
|--------------|------------|-----------------------------------|
| post_code    | integer    | null: false                       |
| prefecture   | string     | null: false                       |
| city         | string     | null: false                       |
| adress_num   | integer    | null: false                       |
| buiding_name | string     | null: false                       |
| phone_num    | integer    | null: false                       |
| user         | references | null: false, foreign_key: true    |

### Association
belongs_to :purchase_record

