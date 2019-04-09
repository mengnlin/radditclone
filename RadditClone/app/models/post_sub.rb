class PostSub < ApplicationRecord
  validates :post_id, :sub_id, presence: true

  has_many :posts 
  has_many :subs

end

