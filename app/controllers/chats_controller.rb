class ChatsController < ApplicationController
  before_action :authenticate_user!


  PER = 100
  
  
  def show
    @messages = Message.all.page(params[:page]).per(PER).reverse_order
  end


end