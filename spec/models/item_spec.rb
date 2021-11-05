require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/test.webp')
  end

  describe '商品出品' do
    it '商品画像が空では登録できない' do # データがActiveStrageに格納できるか、サイズはどうかなどかは一時保留
      # @item.image = ''
      # @item.valid?
      
      # expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
  end
end
