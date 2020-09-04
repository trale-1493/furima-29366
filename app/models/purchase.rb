class Purchase < ApplicationRecord
  belongs_to_active_hash :region

  belongs_to :user
  belongs_to :product
  has_one :address
end
