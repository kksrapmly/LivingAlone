class UsersController < ApplicationController


  PER = 10

 
  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end

  def confirm
    @user = User.find(params[:id])
    @house = House.where(user_id: current_user)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(PER).reverse_order
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(PER).reverse_order
  end

  def matching
    @user = User.find(params[:id])
    @users = current_user.matching
    # @users = @user.matching.page(params[:page]).per(PER).reverse_order
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