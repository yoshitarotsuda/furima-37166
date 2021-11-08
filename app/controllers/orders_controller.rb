class OrdersController < ApplicationController

  def index
    
  end

  def create
    @order = Order.new(params.permit(:item_id).merge(user_id: current_user.id))
    @order.save
  end

end