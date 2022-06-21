class Comment < ApplicationRecord
  belongs_to :idea

  validates :content, presence: { message: "must be a minimum of 10 characters long" }, length: { minimum: 10, message: "must be a minimum of 10 characters long" }

  scope :order_by_most_recent, -> {order('created_at desc')}
end
