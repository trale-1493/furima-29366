class PurchasesController < ApplicationController  
  before_action :set_product, only: [:index, :create]
  before_action :move_to_sign_in, only: [:index]
  before_action :move_to_index, only: [:index]
  
  def index
    @purchase = PurchaseAddress.new
  end

  def create
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

  def pay_product
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.value,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    if @product.purchase || @product.user.id == current_user.id
      redirect_to root_path
    end
  end
end
