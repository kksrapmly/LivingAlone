class HousesController < ApplicationController
  
  
  PER = 10

  def index
    @user = current_user
    unless params[:search].blank?
      address = House.where("address LIKE ?", "%#{params[:search]}%")
      merged_result = address
      @houses = merged_result
      @houses = Kaminari.paginate_array(@houses).page(params[:page]).per(PER)
    else
      @houses = House.page(params[:page]).per(PER).reverse_order
    end
  end

  def show
    @house = House.find(params[:id])
    @user = @house.user
  end

  def new
    @house = House.new
    @user = current_user
    @houses = @user.houses
  end

  def create
    @house = House.new(house_params)
    @house.user_id = current_user.id
    @user = current_user
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
    params.require(:house).permit(:user_id, :title, :house_image, :prefecture, :address, :body, :price, :deposit, :key, :construction, :comment, :status)
  end


end