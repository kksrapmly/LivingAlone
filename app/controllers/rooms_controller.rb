class RoomsController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
    # @users = User.curret_user.matching
    @rooms = Room.all
  end

  def create
    if Room.between(params[:to_id], params[:from_id]).present?
      @room = Room.between(params[:to_id], params[:from_id]).first
    else
      @room = Room.create!(room_params)
    end
    redirect_to room_talks_path(@room)
  end

  private

  def room_params
    params.permit(:to_id, :from_id)
  end


end