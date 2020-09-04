class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
    @address = Address.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase = @product.build_purchase(purchase_params)
    @address = @purchase.build_address(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.permit.merge(user_id: current_user.id)
  end

  def address_params
    params[:purchase].permit(:postal_code, :region_id, :city, :city_number,
                             :building, :telephone_number)
  end
end
