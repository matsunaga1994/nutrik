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
- has_many :sns_credentials

## foods テーブル
 
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| cook_time_id  | integer    | null: false                    |
| cost_id       | integer    | null: false                    |
| comment       | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :likes
- has_many :ingredients
- has_many :recipes


## sns_credentials テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| provider      | string     | null: false                    |
| uid           | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| food   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food


## ingredients テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| food_group_id | integer    | null: false                    |
| serving       | string     | null: false                    |
| amount        | string     | null: false                    |
| food          | references | null: false, foreign_key: true |

### Association

- belongs_to :food


## recipes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| food          | references | null: false, foreign_key: true |

### Association

- belongs_to :food