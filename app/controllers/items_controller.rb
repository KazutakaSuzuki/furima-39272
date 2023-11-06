class ItemsController < ApplicationController
  before_action :move_to_instore, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :item_purchase, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
    return unless @item.user_id != current_user.id && @item.order.nil?

    redirect_to root_path
  end

  def update
    @item.update(item_params)
    if @item.update
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      redirect_to root_path if @item.destroy
    else
      render :show
    end
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

  def find_item
    @item = Item.find(params[:id])
  end

  def item_purchase
    @item = Item.find(params[:id])
    return unless @item.order.present?

    redirect_to root_path
  end
end
