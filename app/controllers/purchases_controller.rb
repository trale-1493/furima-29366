class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
    @address = Address.new
  end

  def create

  end
end
