class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,               null: false, foreign_key: true # 外部キー設定
      t.references :item,               null: false, foreign_key: true # 外部キー設定
      t.timestamps
    end
  end
end