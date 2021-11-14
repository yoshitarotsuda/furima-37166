class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :comment
  end
end
