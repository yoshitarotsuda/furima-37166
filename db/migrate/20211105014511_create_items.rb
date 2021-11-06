class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.text       :item_description,   null: false
      t.integer    :item_category_id,   null: false
      t.integer    :item_state_id,      null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :delivery_area_id,   null: false
      t.integer    :delivery_day_id,    null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true # 外部キー設定
      t.timestamps
    end
  end
end

# 外部キーのカラムの追加にreference型を使うメリット
# userではなくuser_idというカラム名を作成してくれる
# インデックスを自動で貼ってくれる
# 注)外部キー制約はreferenceだけでは付かないことに気を付ける