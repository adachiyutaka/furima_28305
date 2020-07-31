class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
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
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :including_postage_id, :consignor_location_id, :ready_time_id, :price, :image).merge(user_id: current_user.id)
  end
end