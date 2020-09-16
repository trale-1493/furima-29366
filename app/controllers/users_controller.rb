class UsersController < ApplicationController

  def show
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])      
      @purchases = @user.purchases.includes(:product)
    else
      @user = User.select(:id, :nickname, :birthday).find(params[:id])      
    end
  end
end
