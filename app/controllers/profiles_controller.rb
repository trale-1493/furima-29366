class ProfilesController < ApplicationController
  before_action :set_new_profile, only: [:new, :create]
  before_action :set_profile, only: [:edit, :update]
  before_action :move_to_root, only: [:new, :create, :edit, :update]
  def new
  end

  def create
    if @profile.save
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(params[:user_id])
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :introduction, :hobby, :life_word)
  end

  def set_new_profile
    user = User.find(params[:user_id])
    @profile = user.build_profile
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def move_to_root
    unless user_signed_in? && current_user.id == @profile.user.id
      redirect_to root_path
    end
  end
end