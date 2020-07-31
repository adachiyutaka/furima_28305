class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    item = Item.find_by(id: params[:id])
    if item.update(item_params)
      redirect_to item_path(item)
    else
      render :edit
    end
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end
  
  private
  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :including_postage_id, :consignor_location_id, :ready_time_id, :price, :image).merge(user_id: current_user.id)
  end
end