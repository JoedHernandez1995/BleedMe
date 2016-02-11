class ProfilesController < ApplicationController

  before_action :set_profile, only: [:edit, :update, :show, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    #add user here
    if @profile.save
      flash[:success] = "Profile was sucessfully created"
      redirect_to profile_path(@profile)
    else
      render 'new'
    end
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile was successfully updated"
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @profile.destroy
    flash[:danger] = "Profile was successfully deleted"
    redirect_to profile_path
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :last_name, :birth_date, :biography, :country, :city, :phone_number, :cell_phone, :blood_type, :image)
    end
end
