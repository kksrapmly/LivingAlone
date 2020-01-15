class UsersController < ApplicationController


  def show
  end

  def confirm
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to confirm_user_path(@user.id), notice: "プロフィールを更新しました。"
    else
      flash.now[:user] = "プロフィールの更新に失敗しました。全ての項目を入力して下さい。"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "退会しました。ご利用ありがとうございました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :which, :sex, :prefecture, :user_image, :introduction, :email)
  end


end