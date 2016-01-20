class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @user = User.find params[:user_id]
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @user = User.find params[:user_id]
    @profile = @user.profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @user = User.find params[:user_id]
    @profile = Profile.new(profile_params)
    @profile.user_id = @user.id

    if @profile.save
      redirect_to [@user, @profile], notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @user = User.find params[:user_id]
    @profile = Profile.find params[:id]
    if @profile.update_attributes(profile_params)
       redirect_to [@user, @profile], notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :gender, :birth_date, :country, {avatar: []})
    end
end
