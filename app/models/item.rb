class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :including_postage_id
    validates :consignor_location_id
    validates :ready_time_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  has_one_attached :image
  belongs_to_active_hash :category_id, :condition_id, :including_postage_id, :consignor_location_id, :ready_time_id
  belongs_to :user
end
