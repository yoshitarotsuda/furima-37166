class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_state_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end