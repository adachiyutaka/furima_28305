class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end
  
  private
  def message_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :including_postage_id, :consignor_location_id, :ready_time_id, :price, :image).merge(user_id: current_user.id)
  end
end