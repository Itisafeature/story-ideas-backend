class Idea < ApplicationRecord
  has_many :comments
  validates :title, presence: { message: "Title must be a minimum of 5 characters long" }, length: { minimum: 5, message: "Title must be a minimum of 5 characters long" }
  validates :content, presence: { message: "Content must be a minimum of 10 characters long" }, length: { minimum: 10, message: "Content must be a minimum of 10 characters long" }

  scope :order_by_created, -> { order(created_at: :desc) }
  scope :most_recently_commented, -> { select('ideas.*, MAX(comments.created_at)').joins(:comments).order('com
  ments.created_at desc').group('ideas.id').limit(9) }
end
