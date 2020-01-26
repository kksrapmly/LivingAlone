class ChatsController < ApplicationController


  PER = 100
  
  
  def show
    @messages = Message.all.page(params[:page]).per(PER).reverse_order
  end


end