class UsersController < ApplicationController


  def show
  end

  def confirm
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :which, :sex, :prefecture, :user_image_id, :introduction)
  end


end