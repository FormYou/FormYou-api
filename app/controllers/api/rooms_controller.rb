class Api::RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :is_admin?, only: [:create, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all

    render json: @rooms
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:room_number)
    end

    def is_admin?
      unless current_user.role == "admin"
        render json: {error: ["accessible aux admin seulement"]}, status: :unauthorized
      end
    end
end
