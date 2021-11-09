FactoryBot.define do
  factory :order_delivery do
    postal_code {'000-0000'}
    delivery_area_id {2}
    city {'テスト区'}
    block {'0-0-0'}
    building_name {'テストビル'}
    phone_number {'00000000000'}
    token {"tok_e59d9bfaf22568bf466e2affd441"}
  end
end