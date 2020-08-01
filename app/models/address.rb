class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/, message: 'is invalid. Input half-width numbers contain hyphen'}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid. Input half-width numbers without hyphen.'}
  end
  belongs_to :item_order
end
