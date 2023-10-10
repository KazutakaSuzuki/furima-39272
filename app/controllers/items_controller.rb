class ItemsController < ApplicationController
  before_action :move_to_instore, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def move_to_instore
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :category_id, :quality_id, :fee_status_id, :prefecture_id,
                                 :schedule_id, :price).merge(user_id: current_user.id)
  end
end
