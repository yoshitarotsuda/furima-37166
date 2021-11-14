class Item < ApplicationRecord

  NUMBER_REGEX = /\A[0-9]+\z/.freeze # 半角数値

  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments
  # 選択肢用のアソシエーション 記述するときにカラム名にしないように注意
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do #with_options オプションの記述をまとめるのに使える、if使用時の記述パターンに注意
    validates :image
    validates :item_name
    validates :item_description
    with_options numericality: { other_than: 0, message: "を選択してください"} do # 以下の選択肢に対するバリデーションや分岐は追加実装を多少考えているので残します
      validates :item_category_id # , numericality: { other_than: 0, greater_than_or_equal_to: 1,less_than_or_equal_to: 10, message: "can't be blank"} # only_integer:trueはおそらく不要
      validates :item_state_id # , numericality: { other_than: 0, greater_than_or_equal_to: 1,less_than_or_equal_to: 6, message: "can't be blank"}
      validates :delivery_charge_id # , numericality: { other_than: 0, greater_than_or_equal_to: 1,less_than_or_equal_to: 2, message: "can't be blank" }
      validates :delivery_area_id #, numericality: { other_than: 0, greater_than_or_equal_to: 2,less_than_or_equal_to: 48, message: "can't be blank" }
      validates :delivery_day_id # , numericality: { other_than: 0, greater_than_or_equal_to: 1,less_than_or_equal_to: 3,message: "can't be blank" }
    end
    validates :price, numericality: { with: NUMBER_REGEX, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 ,message: "は半角で300~9999999の間の数値を入力してください"}
    # validates :price, numericality: { in: 300..9999999,message: "300~9999999で入力してください"} Rails 6.1から Rails 6.0.4.1では不可
  end

end
