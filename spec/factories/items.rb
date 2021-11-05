FactoryBot.define do
  factory :item do
    image              {Faker::Lorem.sentence}
    item_name          {'item'}
    item_descripution  {'item_descripution'}
    item_category_id   {1}
    item_state_id      {1}
    delivery_charge_id {1}
    delivery_area_id   {2}
    delivery_day_id    {1}
    price              {500}
    association :user
  end
end
