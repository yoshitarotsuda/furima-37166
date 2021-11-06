require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/test.webp') #public1ディレクトリ の画像１ファイル参照
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it '以下の出品できない場合を満たさない場合登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができる時'
      it '商品画像が空では登録できない' do # データがActiveStrageに格納できるか、サイズはどうかなどかは一時保留
        @item.image = nil # ''ではエラーが出る
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        
      end
      it 'カテゴリーが空または「---」では登録できない' do

      end
      it '商品の状態が空または「---」では登録できない' do
        
      end
      it '配送料の負担が空または「---」では登録できない' do
        
      end 
      it '配送元の地域が空または「---」では登録できない' do
        
      end
      it '発送までの日数が空または「---」では登録できない' do
        
      end
      it '価格の情報が空では登録できない' do
        
      end
      it '価格の情報は半角数値でなければ登録できない' do
        
      end
      it '価格の情報は300以上9999999以下でなければ登録できない' do
        
      end
    end
  end
end
