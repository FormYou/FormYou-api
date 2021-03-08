class Api::AttendencesController < ApplicationController
  before_action :set_attendence, only: [:show, :update, :destroy]
  before_action :find_session, only: [:create, :update]
  before_action :authenticate_user!
  before_action :is_teacher?, only: [:update]

  # GET /attendences
  def index
    @attendences = Attendence.all

    render json: @attendences
  end

  # GET /attendences/1
  def show
    render json: @attendence
  end

  # POST /attendences
  def create
    @attendence = Attendence.new(attendence_params)
    @attendence.user = current_user

    if @attendence.save
      render json: @attendence, status: :created
    else
      render json: @attendence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendences/1
  def update
    if @attendence.update(session: @session, user: current_user, note: params[:note])
      render json: @attendence
    else
      render json: @attendence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendences/1
  def destroy
    @attendence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendence
      @attendence = Attendence.find(params[:id])
    end

    def find_session
      @session = Session.find(params[:session_id])
    end

    def attendence_params
      params.require(:attendence).permit(:session_id)
    end

    def is_teacher?
      unless current_user.role == "teacher"
        render json: {error: ["accessible aux prof seulement"]}, status: :unauthorized
      end
    end
end
