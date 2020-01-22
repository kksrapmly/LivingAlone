class RelationshipsController < ApplicationController
  

  def new
    @relationship = Relationship.new
  end

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user, notice: "いいねしました"
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user, notice: "いいねを取り消しました"
  end

  private

  def create_params
    params.permit(:followed_id)
  end


end