class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message:"は○○○-○○○○の形式で入力してください"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message:"はハイフン無しの10文字から11文字の半角数値で入力してください"}
    validates :token
  end

  validates :delivery_area_id, presence: true, numericality: { other_than: 0, message:"を選択してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryDestination.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end