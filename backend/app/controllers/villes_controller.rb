class VillesController < ApplicationController
  before_action :set_ville, only: [:show, :update, :destroy]

  # GET /villes
  def index
    @villes = Ville.all

    render json: @villes
  end

  # GET /villes/1
  def show
    render json: @ville
  end

  # POST /villes
  def create
    @ville = Ville.new(ville_params)

    if @ville.save
      render json: @ville, status: :created, location: @ville
    else
      render json: @ville.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /villes/1
  def update
    if @ville.update(ville_params)
      render json: @ville
    else
      render json: @ville.errors, status: :unprocessable_entity
    end
  end

  # DELETE /villes/1
  def destroy
    @ville.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ville
      @ville = Ville.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ville_params
      params.require(:ville).permit(:nom, :pay_id)
    end
end
