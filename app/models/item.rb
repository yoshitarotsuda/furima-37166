class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # 選択肢用のアソシエーション 記述するときにカラム名にしないように注意
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do #with_options オプションの記述をまとめるのに使える、if使用時の記述パターンに注意
    validates :image
    validates :item_name
    validates :item_description
    with_options numericality: { other_than: 0, message: "can't be blank"} do
      validates :item_category_id
      validates :item_state_id
      validates :delivery_charge_id
      validates :delivery_area_id
      validates :delivery_day_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 ,message: "金額は300~9999999で入力してください"}
    # validates :price, numericality: { in: 300..9999999,message: "300~9999999で入力してください"} Rails 6.1から Rails 6.0.4.1では不可
  end

end
