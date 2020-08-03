FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    text {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    including_postage_id {2}
    consignor_location_id {2}
    ready_time_id {2}
    price {1000}
    association :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.jpg'), 'image/jpeg') }
  end
end
