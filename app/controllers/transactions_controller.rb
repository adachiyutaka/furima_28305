class TransactionsController < ApplicationController
  before_action :set_item

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.create(item_id: @item.id, user_id: current_user.id)
    if @item_order.valid? && Address.create(address_params).valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:card_token],
        currency: 'jpy'
      )
      redirect_to root_path
    else
      @item_order.destroy
      render item_transactions_path
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_order_id: @item_order.id)
  end
end