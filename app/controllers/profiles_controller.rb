class ProfilesController < ApplicationController

  def new
    user = User.find(params[:user_id])
    @profile = user.build_profile
  end

  def create
    user = User.find(params[:user_id])
    @profile = user.build_profile(profile_params)
    if @profile.save
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
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
end
