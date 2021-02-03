class CentreInteretsController < ApplicationController
  before_action :set_centre_interet, only: [:show, :update, :destroy]

  # GET /centre_interets
  def index
    @centre_interets = CentreInteret.all

    render json: @centre_interets
  end

  # GET /centre_interets/1
  def show
    render json: @centre_interet
  end

  # POST /centre_interets
  def create
    @centre_interet = CentreInteret.new(centre_interet_params)

    if @centre_interet.save
      render json: @centre_interet, status: :created, location: @centre_interet
    else
      render json: @centre_interet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /centre_interets/1
  def update
    if @centre_interet.update(centre_interet_params)
      render json: @centre_interet
    else
      render json: @centre_interet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /centre_interets/1
  def destroy
    @centre_interet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centre_interet
      @centre_interet = CentreInteret.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def centre_interet_params
      params.require(:centre_interet).permit(:nom, :profile)
    end
end
