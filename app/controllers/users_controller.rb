class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render_jsonapi_response(@user)
  end
end
