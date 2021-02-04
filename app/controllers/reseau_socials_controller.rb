class ReseauSocialsController < ApplicationController
  before_action :set_reseau_social, only: [:show, :update, :destroy]

  # GET /reseau_socials
  def index
    @reseau_socials = ReseauSocial.all

    render json: @reseau_socials
  end

  # GET /reseau_socials/1
  def show
    render json: @reseau_social
  end

  # POST /reseau_socials
  def create
    @reseau_social = ReseauSocial.new(reseau_social_params)

    if @reseau_social.save
      render json: @reseau_social, status: :created, location: @reseau_social
    else
      render json: @reseau_social.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reseau_socials/1
  def update
    if @reseau_social.update(reseau_social_params)
      render json: @reseau_social
    else
      render json: @reseau_social.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reseau_socials/1
  def destroy
    @reseau_social.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reseau_social
      @reseau_social = ReseauSocial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reseau_social_params
      params.require(:reseau_social).permit(:nom_reseau, :url)
    end
end
