class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show] # deviceメソッド、ログアウトユーザーの移動先限定、指定対象外はログイン画面へ移動
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def edit # 参考資料としてのメモ書きです editは「編集」であり、編集するモデルを特定し、編集された内容を受け取り、updateアクションに内容を送信します。「更新」ではありません。
    if current_user.id == @item.user_id # authenticate_user!のみの制限で良いかと考えたが、よくよく考えると別のログインユーザーが編集できてしまうので必要でした。
    else # unlessの記述の方が良さそうですが、今後editの実行時に記述が入る可能性を考慮しひとまずifで実装しました。
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def destroy # 追加実装では確認ボタン、確認ページを設けることを考慮
    if current_user.id == @item.user_id
      kesu = Item.find(params[:id])
      kesu.destroy
      redilect_to root_path
    else
      render 'show'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_state_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end