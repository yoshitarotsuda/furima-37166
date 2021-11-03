
## usersテーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |
| family_name           | string | null: false              |
| first_name            | string | null: false              |
| family_name_kana      | string | null: false              |
| first_name_kana       | string | null: false              |
| birth_day             | date   | null: false              |

### Association

- has_many : products
- has_many : credit_cards

## productsテーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| products_name        | string     | null: false                   |
| products_description | text       | null: false                   |
| products_category_id | integer    | null: false                   |
| products_state_id    | integer    | null: false                   |
| delivery_charge_id   | integer    | null: false                   |
| delivery_area_id     | integer    | null: false                   |
| delivery_day_id      | integer    | null: false                   |
| price                | integer    | null: false                   |
| user                 | references | null: false, foreign_key:true |

### Association

- has_one : orders
- belongs_to :user

## ordersテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key:true |
| product            | references | null: false, foreign_key:true |

### Association

- belongs_to : users
- belongs_to : products

## delivery_destinations

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| postal_code        | integer    | null: false                   |
| prefectures        | string     | null: false                   |
| city               | string     | null: false                   |
| block              | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | integer    | null: false                   |
| user               | references | null: false, foreign_key:true |
| product            | references | null: false, foreign_key:true |

### Association

- belong_to : products

### 日本語メモ

- unique:true 一意性制約/ユニーク制約/UNIQUE制約/一意制約/unique constraint

  データベースでテーブルにデータを追加、更新する際の制約の一つで、その列の中でデータが一意(他と重複しない)でなければならないという制約。

  例)登録Eメールアドレス、ユーザー名(重複禁止の場合)

- foreign_key:true 外部キー制約

  外部キーとは、関連する他のテーブルのレコードの主キーを値とする項目。

  例)ここでのproductsに対する、『user』

- 主キー制約

  主キーのデータが空になることがなく、かつ重複していないことを保証する制約。
  
  例)Railsでテーブル作成時において自動生成される『id』カラム