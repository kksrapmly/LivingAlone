class HousesController < ApplicationController
  
  
  def index
  end

  def show
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to houses_path, notice: "新しい物件を登録しました。"
    else
      flash.now[:house] = "物件の登録に失敗しました。全ての項目を入力して下さい。"
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def house_params
    params.require(:house).permit(:title, :house_image, :prefecture, :address, :body, :price, :deposit, :key, :construction, :comment, :status)
  end


end