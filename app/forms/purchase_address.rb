class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :token, :user_id, :product_id, :purchase_address, :postal_code, :region_id, :city, :city_number, :building, :telephone_number

  validates :token, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'invalid format.'}
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :city_number, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{,11}\z/, message: "can't use except numbers"}

  def save
    return false if invalid?

    purchase = Purchase.create(user_id: user_id, product_id: product_id)

    Address.create(postal_code: postal_code, region_id: region_id, city: city, city_number: city_number,
                   building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end