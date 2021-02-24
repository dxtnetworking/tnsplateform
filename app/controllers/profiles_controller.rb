class ProfilesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_user
  before_action :set_profile, only: [:show, :update]
  before_action :update_authorization, only: [:update]

  # GET /profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # POST /profiles
  def create
    @profile = @current_user.profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end


  # GET /profiles/1
  def show
    render json: @profile
  end

  # PATCH/PUT /profiles/1
  def update
    if current_user.profile.update profile_params
      render json: @profile 
      # redirect_to :show 
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  # def destroy
  #   @profile.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def update_authorization
      current_user.id == @profile.user_id
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(
        :adresse, 
        :photo_url, 
        :niveau_etude, 
        :profession, 
        :occupation_actuelle, 
        :attentes_networking, 
        :membre_equipe_pilote, 
        :statut, 
        :date_adhesion, 
        :date_resiliation, 
        :motif_resiliation, 
        :user_id)
    end
end
