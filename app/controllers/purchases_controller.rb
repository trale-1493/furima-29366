class PurchasesController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.save
      pay_product
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :region_id, :city, :city_number,
                                             :building, :telephone_number).merge(token: params[:token], user_id: current_user.id, product_id: @product.id)
  end

  def address_params
    params.require(:purchase).permit(:postal_code, :region_id, :city, :city_number,
                                     :building, :telephone_number)
  end

  def pay_product
    Payjp::api_key = "sk_test_d8fd7b8ebc89ed98620dc438"
    Payjp::Charge.create(
      amount: @product.value,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
