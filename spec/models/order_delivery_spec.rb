require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品の購入' do
    before do 
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep(1) # 未解決問題のメモ書きです、アソシエーションの問題かと考えましたが、単純にcreateを連続で行っているのが原因によるMYSQLの負荷によるエラーだったのかもしれないと予想します。
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
    end

    context '購入ができる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end
    context '購入ができない場合' do
      it 'postal_codeが空だと保存できない' do
        @order_delivery.postal_code =''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは「3桁ハイフン4桁」かつ半角数値でないと保存できない' do
        @order_delivery.postal_code ='aaa-bbbb'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code ○○○-○○○○の形式で入力してください")
        @order_delivery.postal_code ='0000000-'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code ○○○-○○○○の形式で入力してください")
      end
      it 'delivery_area_idが空または「---」だと保存できない' do
        @order_delivery.delivery_area_id =''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Delivery area can't be blank")
        @order_delivery.delivery_area_id ='0'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_delivery.city =''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
    
      it 'blockが空だと保存ができない' do
        @order_delivery.block =''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_delivery.phone_number =''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフン無しの10桁以上11桁以内の半角数値以外では保存できない' do
        @order_delivery.phone_number ='000000000' # 9桁
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number ハイフン無しの10文字から11文字の半角数値で入力してください")
        @order_delivery.phone_number ='000000000000' # 12桁
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number ハイフン無しの10文字から11文字の半角数値で入力してください")
        @order_delivery.phone_number ='000-000-000' # 11桁
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number ハイフン無しの10文字から11文字の半角数値で入力してください")
      end
      it 'token(クレジットカード情報)が空だと保存できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
