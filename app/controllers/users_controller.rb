class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    if @user.id == current_user.id
      @purchases = @user.purchases.includes(:product)
    end
  end
end
