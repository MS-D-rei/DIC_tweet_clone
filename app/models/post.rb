class Post < ApplicationRecord
  validates :post, presence: true, length: { maximum: 140 }
end
