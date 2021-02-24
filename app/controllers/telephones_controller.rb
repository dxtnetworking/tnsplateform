class TelephonesController < ApplicationController
  before_action :set_profile
  before_action :set_telephone, only: [:delete, :update]

  # POST /telephones
  def create
    @telephone = @profile.telephones.new(telephone_params)

    if @telephone.save
      render json: @telephone, status: :created, location: @telephone
    else
      render json: @telephone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /telephones/1
  def update
    if @telephone.update(telephone_params) && is_current_profile?
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
      @telephone = @profile.telephones.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def is_current_profile?
      current_user.id == @profile.user.id
    end

    # Only allow a trusted parameter "white list" through.
    def telephone_params
      params.require(:telephone).permit(:numero_principal, :numero, :profile_id)
    end
end
