class Api::SessionsController < ApplicationController
    before_action :set_session, only: [:show, :update, :destroy]
    before_action :is_admin?, only: [:create, :update, :destroy]
    before_action :find_formation, only: [:create, :update]
    before_action :authenticate_user!
  
    # GET /formations
    def index
      @sessions = Session.all
  
      render json: @sessions, include: [:formation , :attendences]
    end
  
    # GET /sessions/1
    def show
      render json: @session, include: [:attendences, :formation]
    end
  
    # POST /sessions
    def create
      @session = @formation.sessions.new(session_params)
  
      if @session.save
        render json: @session, status: :created
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /sessions/1
    def update
      if @session.update(session_params)
        render json: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /sessions/1
    def destroy
      @session.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_session
        @session = Session.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def session_params
        params.require(:session).permit(:date, :duration, :room_id)
      end

      def find_formation
        @formation = Formation.find(params[:formation_id])
      end

      def is_admin?
        unless current_user.role == "admin"
          render json: {error: ["accessible aux admin seulement"]}, status: :unauthorized
        end
      end
  end
  