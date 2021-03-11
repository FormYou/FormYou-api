class Api::AssignementCategoriesController < ApplicationController
  before_action :set_assignement_category, only: [:show, :update, :destroy]

  # GET /assignement_categories
  def index
    @assignement_categories = AssignementCategory.all

    render json: @assignement_categories
  end

  # GET /assignement_categories/1
  def show
    render json: @assignement_category
  end

  # POST /assignement_categories
  def create
    @assignement_category = AssignementCategory.new(assignement_category_params)

    if @assignement_category.save
      render json: @assignement_category, status: :created
    else
      render json: @assignement_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assignement_categories/1
  def update
    if @assignement_category.update(assignement_category_params)
      render json: @assignement_category
    else
      render json: @assignement_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignement_categories/1
  def destroy
    @assignement_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignement_category
      @assignement_category = AssignementCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignement_category_params
      params.require(:assignement_category).permit(:category_id, :formation_id)
    end
end
