class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.'} do
      validates :first_name
      validates :last_name 
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.'} do
      validates :first_name_kana
      validates :last_name_kana
    end
  end

  validate :password_complexity
  def password_complexity
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?[0-9])[a-z\d]{6,}\z/i

    errors.add :password, 'Complexity requirement not met. Length should be 6 characters or more, include: 1 alphabet and 1 digit and input alphabet and digit'
  end

  has_many :items, dependent: :destroy
  has_many :item_orders, dependent: :destroy
end