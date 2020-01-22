class RelationshipsController < ApplicationController
  

  def new
    @relationship = Relationship.new
  end

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user, notice: "いいねしました" }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user, notice: "いいねを取り消しました" }
      format.js
    end
  end

  private

  def create_params
    params.permit(:followed_id)
  end


end