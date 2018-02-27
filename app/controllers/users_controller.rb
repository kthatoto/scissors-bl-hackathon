class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @page = params[:page]
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_param)
    redirect_to params[:user][:page].to_sym
  end
  private
    def user_param
      params.require(:user).permit(:name, :gender, :region)
    end
end
