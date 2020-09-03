class ProductsController < ApplicationController
  before_action :move_to_signin, only: [:new, :create, :edit, :update]
  before_action :check_id
  def index
    @products = Product.includes(:user, :purchase)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to root_path unless current_user.id == @product.user.id
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to product_path(product.id)
    else
      redirect_to edit_product_path(product.id)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :value, :explain, :category_id, :condition_id,
                                    :delivery_payer_id, :region_id, :delivery_span_id).merge(user_id: current_user.id)
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def check_id

  end
end
