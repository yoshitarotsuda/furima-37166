require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
  end
end