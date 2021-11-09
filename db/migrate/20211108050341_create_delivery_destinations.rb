class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.string    :postal_code,       null: false
      t.integer   :delivery_area_id,  null: false
      t.string    :city,              null: false
      t.string    :block,             null: false
      t.string    :building_name
      t.string    :phone_number,      null: false
      t.references :order,            null: false, foreign_key: true # 外部キー設定
      t.timestamps
    end
  end
end
