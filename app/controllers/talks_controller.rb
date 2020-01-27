class TalksController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @room = Room.find(params[:room_id])
  end


  def index
    @talks = @room.talks

    if @room.to_id == current_user.id
      @user = User.find(@room.from_id)
    elsif @room.from_id == current_user.id
      @user = User.find(@room.to_id)
    end

    if @talks.length > 10
      @over_ten = true
      @talks = Talk.where(id: @talks[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @talks = @room.talks
    end

    # if @talks.last
    #   @talks.last.read = true if @talks.last.user_id != current_user.id 
    # end

    @talk = @room.talks.build
  end

  def create
    @talk = @room.talks.build(talk_params)
    if @talk.save
      redirect_to room_talks_path(@room)
    else
      render 'index'
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:conversation, :user_id)
  end


end