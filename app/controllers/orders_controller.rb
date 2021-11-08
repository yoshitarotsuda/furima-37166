class OrdersController < ApplicationController

  def index
    
  end

  def create
    order = Order.new(params.permit(:item_id).merge(user_id: current_user.id))
    order.save
    delivery_destination = DeliveryDestination.new(params.permit(:postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number).merge(order_id: order.id))
    delivery_destination.save
  end

end