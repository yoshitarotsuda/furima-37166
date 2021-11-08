class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.require(:order_delivery).permit(:postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

end