class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]




  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
 
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path      
    else
      render 'index'
    end

  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :add_number, 
      :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # トークン
      currency: 'jpy'                # 日本円
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

end
