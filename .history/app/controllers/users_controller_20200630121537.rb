class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = set_user
  end
  def create
  end
  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    User.find_by(id: params[:id])
  end

end
