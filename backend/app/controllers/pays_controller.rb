class PaysController < ApplicationController
  before_action :set_pay, only: [:show, :update, :destroy]

  # GET /pays
  def index
    @pays = Pay.all

    render json: @pays
  end

  # GET /pays/1
  def show
    render json: @pay
  end

  # POST /pays
  def create
    @pay = Pay.new(pay_params)

    if @pay.save
      render json: @pay, status: :created, location: @pay
    else
      render json: @pay.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pays/1
  def update
    if @pay.update(pay_params)
      render json: @pay
    else
      render json: @pay.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pays/1
  def destroy
    @pay.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay
      @pay = Pay.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pay_params
      params.require(:pay).permit(:nom, :code_iso)
    end
end
