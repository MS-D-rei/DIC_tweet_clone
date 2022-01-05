class Post < ApplicationRecord
  default_scope -> { order(created_at: :asc) }
  validates :content, presence: true, length: { maximum: 140 }
end
