class Task < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end