class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to action: :index
  end


  private
  def product_params
    params.require(:product).permit(:name, :image, :value, :explain, :category_id, :condition_id,
                                    :delivery_payer_id, :region_id, :delivery_span_id).merge(user_id: current_user.id)
  end
end
