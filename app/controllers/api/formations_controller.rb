class Api::FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:show]
  before_action :is_admin?, only: [:create, :update, :destroy]

  # GET /formations
  def index
    @formations = Formation.all

    render json: @formations
  end

  # GET /formations/1
  def show
    render json: @formation, include: [:user]
  end

  # POST /formations
  def create
    @formation = Formation.new(formation_params)

    if @formation.save
      render json: @formation, include: [:user], status: :created
    else
      render json: @formation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formations/1
  def update
    if @formation.update(formation_params)
      render json: @formation
    else
      render json: @formation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formations/1
  def destroy
    @formation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation
      @formation = Formation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def formation_params
      params.require(:formation).permit(:title, :description, :user_id)
    end

    def is_admin?
      unless current_user.role == "admin"
        render json: {error: ["accessible aux admin seulement"]}, status: :unauthorized
      end
    end
end
