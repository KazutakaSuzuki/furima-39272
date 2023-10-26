class OrdersController < ApplicationController
  before_action :authenticate_user!



  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address = Address.new(order_params)
    binding.pry
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path      
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code,
      :prefecture_id, :city, :add_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  #PAY.JP秘密鍵
        Payjp::Charge.create(
          amount: @item.price,  #商品の値段
          card: order_params[:token],    #カードトークン
          currency: 'jpy'                #通貨の種類(日本円)
        )
  end
end
