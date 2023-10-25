class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.orders.create(order_params)
    @order = OrderAddress.new(order_params)

  end

  private
  def order_params
    params.require(:order_address).permit(:postarl_code, :prefecture_id, :city, :add_number, 
      :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])

  end
end
