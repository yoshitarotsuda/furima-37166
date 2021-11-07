class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show] # deviceメソッド、ログアウトユーザーの移動先限定、指定対象外はログイン画面へ移動
  
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

  def edit # 参考資料としてのメモ書きです editは「編集」であり、編集するモデルを特定し、編集された内容を受け取り、updateアクションに内容を送信します。「更新」ではありません。
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id # authenticate_user!のみの制限で良いかと考えたが、よくよく考えると別のログインユーザーが編集できてしまうので必要でした。
    else # unlessの記述の方が良さそうですが、今後editの実行時に記述が入る可能性を考慮しひとまずifで実装しました。
      redirect_to root_path
    end
  end

  def update
      # binding.pry
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      # binding.pry
      render 'edit'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_state_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end