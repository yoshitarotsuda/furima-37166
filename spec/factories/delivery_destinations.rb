FactoryBot.define do
  factory :delivery_destination do
    postal_code {'000-0000'}
    delivery_area_id {2}
    city {'東京都'}
    block {'0-0-0'}
    building_name {'テストビル'}
    token {"tok_e59d9bfaf22568bf466e2affd441"}
    association :user
    association :item
  end
end