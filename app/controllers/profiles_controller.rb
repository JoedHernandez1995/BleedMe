class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update, :show, :destroy]

  def index
    @profiles = Profile.all
    @posts = Post.all
  end

  def new
    if current_user.profile.nil?
      @profile = Profile.new
    else
      redirect_to profiles_path
    end
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.email = current_user.email
    @profile.username = current_user.username
    if @profile.save
      flash[:success] = "Profile was sucessfully created"
      redirect_to profiles_path
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
    @posts = Post.all
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
      params.require(:profile).permit(:name, :last_name, :birth_date, :biography, :country, :city, :phone_number, :cell_phone, :blood_type, :image, :occupation, :landscape)
    end
end
