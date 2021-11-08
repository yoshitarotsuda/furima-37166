class OrdersController < ApplicationController

  def index
    
  end

  def create
    @order = Order.new
    @order.save
  end
end
