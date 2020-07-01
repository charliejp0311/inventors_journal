class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = set_user
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
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
