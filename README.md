# アプリケーション名
Rings

# アプリケーション概要
外出時の予定を決めるアプリ

# URL
https://rings.onrender.com

# テスト用アカウント
- Basic認証パスワード: john
- Basic認証ID: 2222
- メールアドレス1: sample@sample.com
- パスワード1: a123456
- メールアドレス2: example@test.com
- パスワード2: a123456

# 利用方法
## おすすめ場所（スポット）の投稿
1. トップページのヘッダーから新規登録、またはログインを行う
2. トップページに投稿ページがあり、そこからおすすめの場所の投稿ができる。
3. トップページで投稿した場所の閲覧ができる
## PlanAssist（予定を決めるシステム）の使い方
1. トップページの最下部にある
2. プランを決めてほしい土地の名前を入力する（例：表参道、渋谷）
3. 食事系、娯楽系の数を入力
4. 決定をクリックするとプランのページに遷移
## お気に入り機能
1. トップページから任意のスポットをクリックして詳細ページへ遷移
2. 遷移先の最下部にお気に入りボタンがあるためクリック
3. ヘッダーからアカウント名をクリックしてユーザー詳細ページへ遷移
4. 遷移先にあるお気に入り一覧をクリック
5. お気に入り登録したスポットを閲覧できる
## コメント投稿
1. トップページから任意のスポットをクリックして詳細ページへ遷移
2. 遷移先の左側にあるコメント一覧の上から投稿
## 検索機能
1. トップページの最上部にある検索フォームから検索したいワードを入力して検索ボタンをクリック
2. 検索結果ページへ遷移

# アプリケーションを作成した背景
日常の課題からこのアプリを作ろうと考えた。  
- 友人と会いたいが行きたい場所が特になくいつも同じ場所であったこと。  
- 訪れた店が閉店していた、混んでいたなどの突発的な理由によりすぐに予定を決めたかったこと。  
などの課題を解決するためには「瞬間的におすすめの場所が出力」、「特定の条件を入力するとそれにマッチした場所が出力」が必要と考えた。  
これらの場所を選ぶ機能とそれらの場所を投稿できる機能を実装したアプリケーションを開発することにした。

# 実装した機能についての画像やGIFでの説明
## PlanAssist（予定を決めるシステム）の使い方
[![Image from Gyazo](https://i.gyazo.com/d4b0e559eec847d43884893e4210a0c9.gif)](https://gyazo.com/d4b0e559eec847d43884893e4210a0c9)

# 実装予定の機能
- コメントと共に投稿する星5つ評価機能
- 地図のAPI導入
- 目的地が一緒の場合のマッチング機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/6c315aa919fa234d5994fe52f57304ad.png)](https://gyazo.com/6c315aa919fa234d5994fe52f57304ad)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/ccc9bed67f36363e2c55e632f7308fc0.png)](https://gyazo.com/ccc9bed67f36363e2c55e632f7308fc0)

# 開発環境
- Ruby on rails
- JavaScript
- HTML CSS
- Rspec
- VSコード
- Render

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/rings-39998  
% cd rings-39998  
% bundle install  
% yarn install

# 制作時間
1ヶ月

# 改善点
## ユーザーからの意見
- 条件を満たすプランが存在しない場合はプランが存在しない旨を表示させた方が良い
- 投稿はこちらからのボタンが中央に配置されていない
これは意図的？

# 工夫したポイント
- どの年代の方でも使いやすいようにシンプルな見た目と使い方の説明
- 見やすいようにするため、シンプルな見た目と優しい色にした

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
| text               | text       | null: false                    |
| user               | references | null: false , foreign_key: true|
| location           | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :location


