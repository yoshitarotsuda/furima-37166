class Item < ApplicationRecord
  belong_to :user

  # 選択肢用のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day_id

end
