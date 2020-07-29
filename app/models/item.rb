class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :condition
    validates :including_postage
    validates :consignor_location
    validates :ready_time
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  has_one_attached :image
  belongs_to :user
end
