class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :token, :user_id, :product_id, :purchase_address, :postal_code, :region_id, :city, :city_number, :building, :telephone_number

  def save
    return false if invalid?

    purchase = Purchase.create(user_id: user_id, product_id: product_id)

    Address.create(postal_code: postal_code, region_id: region_id, city: city, city_number: city_number,
                   building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end