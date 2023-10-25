class OrdersController < ApplicationController

  def index
  end

  def show
    Order.show(order.params)
  end

  private
  def order_params
    params.require(:order).permit.(:text).merge(params[:item_id])

  end
end
