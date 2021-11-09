class OrdersController < ApplicationController
  before_action :authenticate_user! # 注文関連の繊維は全て認めないのでこれで設定
  before_action :set_item, only: [:index, :create]
  def index
    @order_delivery = OrderDelivery.new
  end

  def create 
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item # privateなのでitems_controllerと同名でも問題なし
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end