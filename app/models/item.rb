class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name,  length: { maximum: 40 } 
    validates :text,  length: { maximum: 1000 } 
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :including_postage_id
      validates :consignor_location_id
      validates :ready_time_id
    end
  end
  validate :image_presence

  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :including_postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ready_time
  belongs_to :user

  def image_presence
    errors.add(:image, 'must be attached') unless image.attached?
  end

  has_one :item_order, dependent: :destroy
end
