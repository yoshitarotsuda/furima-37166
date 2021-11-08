class OrdersController < ApplicationController

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.require(:order_delivery).permit(:item_id, :postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number)merge(user_id: current_user.id)
  end

end