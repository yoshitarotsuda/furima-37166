class Item < ApplicationRecord
  belongs_to :user

  # 選択肢用のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do #with_options オプションの記述をまとめるのに使える、if使用時の記述パターンに注意
    validates :item_name
    validates :item_description
    validates :price
  end

  with_options presence: true, numericality: { other_than: 0, message: "can't be blank"} do
    validates :item_category_id
    validates :item_state_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
  end
end
