require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('public/test.webp') 今後のアプリ作成における参考資料としてコードの記述を残したいと考えています。
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it '以下の出品できない場合を満たさない場合登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない時' do
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it '商品画像が空では登録できない' do # データがActiveStrageに格納できるか、サイズはどうかなどかは一時保留
        @item.image = nil # ''ではエラーが出る
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが空または「---」では登録できない' do # 選択肢にないデータ送信も念のためテストしています
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーを選択してください")
        @item.item_category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
        @item.item_category_id = '55'
        @item.valid?
        expect(@item.errors.full_messages).to include() # 空白の選択肢です
      end
      it '商品の状態が空または「---」では登録できない' do # 選択肢にないデータ送信も念のためテストしています
        @item.item_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください", "商品の状態を選択してください")
        @item.item_state_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
        @item.item_state_id = '55'
        @item.valid?
        expect(@item.errors.full_messages).to include() # 空白の選択肢です
      end
      it '配送料の負担が空または「---」では登録できない' do # 選択肢にないデータ送信も念のためテストしています
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください", "配送料の負担を選択してください")
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
        @item.delivery_charge_id = '55'
        @item.valid?
        expect(@item.errors.full_messages).to include() # 空白の選択肢です
      end 
      it '配送元の地域が空または「---」では登録できない' do # 選択肢にないデータ送信も念のためテストしています
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください", "発送元の地域を選択してください")
        @item.delivery_area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include() # 空白の選択肢です
      end
      it '発送までの日数が空または「---」では登録できない' do # 選択肢にないデータ送信も念のためテストしています
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数を選択してください")
        @item.delivery_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
        @item.delivery_day_id = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include() # 空白の選択肢です
      end
      it '価格の情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください", "金額は半角で300~9999999の間の数値を入力してください")
      end
      it '価格の情報は半角数値でなければ登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は半角で300~9999999の間の数値を入力してください")
      end
      it '価格の情報は300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は半角で300~9999999の間の数値を入力してください")
      end
      it '価格は9,999,999円を超えると登録できない' do
        @item.price = '10000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は半角で300~9999999の間の数値を入力してください")
      end
    end
  end
end
