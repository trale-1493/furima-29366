class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'must use mixed characters' }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'must use only hull characters' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'must use only hull characters' }
  validates :family_name_cana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'must use only hull Cana characters' }
  validates :first_name_cana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'must use only hull Cana characters' }
  validates :birthday, presence: true

  has_many :products
  has_many :purchases
  has_one :profile
end
