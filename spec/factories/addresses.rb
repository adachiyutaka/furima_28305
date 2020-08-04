FactoryBot.define do
  factory :address do
    postal_code { '123-1234' }
    prefecture_id { 2 }
    city { '市町村名' }
    house_number { '番地' }
    building_name { '建物名' }
    phone_number { '09012345678' }
    association :item_order
  end
end
