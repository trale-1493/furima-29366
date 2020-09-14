class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    if @user.id == current_user.id
      @purchased_products = Product.find(@user.purchases.pluck(:product_id))
    end
  end
end
