class HabilitesExtraProsController < ApplicationController
  before_action :set_habilites_extra_pro, only: [:show, :update, :destroy]

  # GET /habilites_extra_pros
  def index
    @habilites_extra_pros = HabilitesExtraPro.all

    render json: @habilites_extra_pros
  end

  # GET /habilites_extra_pros/1
  def show
    render json: @habilites_extra_pro
  end

  # POST /habilites_extra_pros
  def create
    @habilites_extra_pro = HabilitesExtraPro.new(habilites_extra_pro_params)

    if @habilites_extra_pro.save
      render json: @habilites_extra_pro, status: :created, location: @habilites_extra_pro
    else
      render json: @habilites_extra_pro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /habilites_extra_pros/1
  def update
    if @habilites_extra_pro.update(habilites_extra_pro_params)
      render json: @habilites_extra_pro
    else
      render json: @habilites_extra_pro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /habilites_extra_pros/1
  def destroy
    @habilites_extra_pro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habilites_extra_pro
      @habilites_extra_pro = HabilitesExtraPro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def habilites_extra_pro_params
      params.require(:habilites_extra_pro).permit(:nom, :description)
    end
end
