class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze # 半角英数混合1字以上
  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze # 全角ひらがなカタカナ漢字
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze # 全角カタカナ

  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めてください'
  
  with_option presence: true, format:{ with: ZENKAKU_REGEX, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_option presence: true, format:{ with: KANA_REGEX, message: '全角カナ文字を使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
