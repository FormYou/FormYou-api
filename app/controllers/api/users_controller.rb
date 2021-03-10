class Api::UsersController < Api::BaseController
    before_action :is_admin?, only: %w[index update destroy teacher student checked]
    before_action :find_user, only: %w[show update]
  
    def index
      @users = User.all
      render json: @users
    end

    def show
      render_jsonapi_response(@user)
    end

    def update
      if @user.update(users_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def teacher
      @teacher = User.where(role: "teacher")
      render json: @teacher
    end

    def student
      @student = User.where(role: "student")
      render json: @student
    end

    def checked
      @checked = User.where(checked: false)
      render json: @checked
    end
  
    private
  
    def find_user
      @user = User.find(params[:id])
    end

    def users_params
      params.require(:user).permit(:checked)
    end

    def is_admin?
      unless current_user.role == "admin"
        render json: {error: ["accessible aux admin seulement"]}, status: :unauthorized
      end
    end
  
end