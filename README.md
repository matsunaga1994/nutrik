# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :foods
- has_many :likes

## foods テーブル
 
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| time_id       | integer    | null: false                    |
| cost_id       | integer    | null: false                    |
| comment       | text       | null: false                    |
| ingredient    | text       | null: false                    |
| recipe        | text       | null: false                    |
|               |            | null: false                    |
|               |            | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :likes

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| food   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food