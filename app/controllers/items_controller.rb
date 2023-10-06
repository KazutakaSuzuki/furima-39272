class ItemsController < ApplicationController

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :quality_id, :fee_status_id, :prefecture_id, :schedule_id, :price)
  end


end
