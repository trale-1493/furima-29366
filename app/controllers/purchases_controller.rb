class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
  end

  def create

  end
end
