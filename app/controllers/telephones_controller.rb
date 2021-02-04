class TelephonesController < ApplicationController
  before_action :set_telephone, only: [:show, :update, :destroy]

  # GET /telephones
  def index
    @telephones = Telephone.all

    render json: @telephones
  end

  # GET /telephones/1
  def show
    render json: @telephone
  end

  # POST /telephones
  def create
    @telephone = Telephone.new(telephone_params)

    if @telephone.save
      render json: @telephone, status: :created, location: @telephone
    else
      render json: @telephone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /telephones/1
  def update
    if @telephone.update(telephone_params)
      render json: @telephone
    else
      render json: @telephone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /telephones/1
  def destroy
    @telephone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telephone
      @telephone = Telephone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def telephone_params
      params.require(:telephone).permit(:numero_principal, :numero, :profile_id)
    end
end
