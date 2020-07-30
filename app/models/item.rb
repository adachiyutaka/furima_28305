class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :text
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :including_postage_id
      validates :consignor_location_id
      validates :ready_time_id
    end
  end

  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :including_postage
  belongs_to_active_hash :consignor_location
  belongs_to_active_hash :ready_time
  belongs_to :user
end
