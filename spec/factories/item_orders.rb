FactoryBot.define do
  factory :item_order do
    association :user
    association :item
  end
end
