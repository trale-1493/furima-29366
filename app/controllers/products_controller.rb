class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index
    else
      render :new
    end
  end


  private
  def product_params
    params.require(:product).permit(:name, :image, :value, :explain, :category_id, :condition_id,
                                    :delivery_payer_id, :region_id, :delivery_span_id).merge(user_id: current_user.id)
  end
end
