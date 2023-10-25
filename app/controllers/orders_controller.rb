class OrdersController < ApplicationController
  before_action :authenticate_user!



  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path      
    else
      render :index
    end

  end

  private
  def order_params
    params.require(:order_address).permit(:postarl_code, :prefecture_id, :city, :add_number, 
      :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])

  end
end
