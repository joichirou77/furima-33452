class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_user, only: [:show, :edit, :update]
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_user
    @item = Item.find(params[:id])
  end
end
