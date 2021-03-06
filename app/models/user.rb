class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze # 半角英数混合1字以上
  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/.freeze # 全角ひらがなカタカナ漢字、utf-8で記号と認識される「々」と長音記号「ー」も追加
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze # 全角カタカナ

  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角で英数字の両方を含めてください'
  
  with_options presence: true, format:{ with: ZENKAKU_REGEX, message: 'には全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format:{ with: KANA_REGEX, message: 'には全角カナ文字を使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  has_many :items
  has_many :orders
  has_many :comments
end