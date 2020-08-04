class TransactionsController < ApplicationController
  before_action :set_item
  before_action :sold_out?

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.create(item_id: @item.id, user_id: current_user.id)
    if @item_order.valid? && Address.create(address_params).valid?
      payjp_chage
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

  def sold_out?
    redirect_to root_path if @item.item_order.present?
  end

  def payjp_chage
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:card_token],
      currency: 'jpy'
    )
  end
end