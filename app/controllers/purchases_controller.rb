class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
    @address = Address.new
  end

  def create
    binding.pry
    @product = Product.find(params[:product_id])
    @purchase = @product.build_purchase(purchase_params)
    @address = @purchase.build_address(address_params)
    if @address.save
      pay_product
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:token).merge(user_id: current_user.id)
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
