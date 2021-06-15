# アプリ名
  Nutrik (Nutrition Cooking)
# 概要
  料理レシピを投稿し、共有ができるアプリです。  
  投稿した料理について、簡単な栄養バランス（6つの基礎食品群）の表示ができます。

# 本番環境
https://nutrik.herokuapp.com/

ログイン情報（テスト用）  
- Eメール：test01@gmail.com
- パスワード：test01

- Eメール：teat02@gmail.com
- パスワード：test02

## 制作背景（意図）
- 料理のレパートリーを増やすこと、バランスよく栄養を摂取できるようになることを目標にこのアプリを作成いたしました。
- その背景として、昨年度結婚いたしまして、嫁が手料理を作ってくれているのですが、「今日はなに作ろうかな」「野菜はしっかり取れているかな」とよく呟いていました。
- 料理投稿アプリは数多く存在し、栄養バランスも細かく表示されているものもありますが、機能が充実しすぎているために少し使いづらい印象を受けました。
- そこで料理レシピの共有及び栄養バランス（6つの基礎食品群）のグラフ表示に重点をおき、見やすさ重視の料理投稿アプリを作成いたしました。

### 目的のターゲット層
- 料理レパートリーを増やしたい人  
- 栄養バランスを気にしている人
  

### どんなニーズ課題に
- 視覚的に簡単に栄養バランスを把握したい
- 今日のご飯の参考にしたい

# DEMO
## 1.料理の投稿
ログイン後、マイページのレシピ投稿ボタンからレシピ投稿ページに遷移します。  
レシピタイトル、料理画像、調理時間（プルダウン）、費用目安（プルダウン）、レシピコメント、食材、作り方を入力することで料理の投稿ができます。
[![Image from Gyazo](https://i.gyazo.com/40e040cfd2d790c28a741e994053fc14.gif)](https://gyazo.com/40e040cfd2d790c28a741e994053fc14)

## 2.料理の表示
投稿した料理は、トップページ及びマイページに表示されます。
[![Image from Gyazo](https://i.gyazo.com/d3998afdaf6bfd35571e922378eae340.jpg)](https://gyazo.com/d3998afdaf6bfd35571e922378eae340)[![Image from Gyazo](https://i.gyazo.com/fe39460d4ad8f23217de3e51dd51205e.jpg)](https://gyazo.com/fe39460d4ad8f23217de3e51dd51205e)

## 3.料理詳細表示
投稿した料理の詳細情報の確認ができます。
複数枚画像を投稿した場合にはスライドショーで画像を表示しています。
[![Image from Gyazo](https://i.gyazo.com/0604f67029fdfa85594d2afc726dad75.gif)](https://gyazo.com/0604f67029fdfa85594d2afc726dad75)

## 4.いいね機能
投稿された料理レシピについていいねすることができます。
いいねした料理はマイページにていつでも確認できます。
トップページにていいね数の応じてTOP5を表示しています。
[![Image from Gyazo](https://i.gyazo.com/1bfb7752b4e3ba0a2956df2ac802fe9e.gif)](https://gyazo.com/1bfb7752b4e3ba0a2956df2ac802fe9e)
[![Image from Gyazo](https://i.gyazo.com/0e1fea255c8364080fe57b8643481036.jpg)](https://gyazo.com/0e1fea255c8364080fe57b8643481036)

## 5.料理検索機能
ヘッダーにある検索フォームに料理名を入力することで検索ができます。
![検索](https://user-images.githubusercontent.com/82854197/121999107-da631c80-cde7-11eb-9e9a-016deab43216.jpeg)
![検索２](https://user-images.githubusercontent.com/82854197/121998685-39746180-cde7-11eb-8d5a-e4c3778e7b24.jpeg)



## 6.料理の編集・削除機能
編集機能については、現在実装中になります。
<img width="1364" alt="削除編集" src="https://user-images.githubusercontent.com/82854197/121986190-0e7f1300-cdd1-11eb-9002-789c7ed2ddc5.png"><img width="1401" alt="編集削除２" src="https://user-images.githubusercontent.com/82854197/121986239-1e96f280-cdd1-11eb-88cd-1a5afc919b06.png">


# 工夫したポイント

- 自分が投稿した料理、いいねした料理がいつもでも見返せるようにマイページを実装しました。  
【DEMO No.4参照】
- ログインをしやすくするためにgoogle、facebookを用いて新規登録、ログインをできるようにしました。
[![Image from Gyazo](https://i.gyazo.com/9053ff4c4a3171e62a5357710a0b4dbf.png)](https://gyazo.com/9053ff4c4a3171e62a5357710a0b4dbf)[![Image from Gyazo](https://i.gyazo.com/ba58e6caa51299af11fb133b3c1b8ea1.png)](https://gyazo.com/ba58e6caa51299af11fb133b3c1b8ea1)

# 使用技術（開発環境）
Ruby, Ruby on Rails  
HTML, CSS, JavaScript, jQuery  
AWA(S3)  
mysql
GitHub, GitHubDesktop  
rspec  
VScord

# 今後実装したい機能
- いいね機能の非同期通信化
- 料理画像を複数枚投稿する際、画像の順番を入れ替え・削除することができる機能
- 投稿した料理の編集機能
- ユーザーフォロー機能
- 材料名で検索ができる機能

# DB設計

![nutrik](https://user-images.githubusercontent.com/82854197/121998062-3d53b400-cde6-11eb-9d1c-d26723f16f64.png)



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
| serving       | string     | null: false                    |

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