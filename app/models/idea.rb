class Idea < ApplicationRecord
  has_many :comments
  validates :title, presence: { message: "Title must be between 5 and 30 characters long" }, length: { in: 5..30, message: "Title must be between 5 and 30 characters long" }
  validates :content, presence: { message: "Content must be a minimum of 10 characters long" }, length: { minimum: 10, message: "Content must be a minimum of 10 characters long" }

  scope :order_by_created, -> { order(created_at: :desc) }
  scope :most_recently_commented, -> { select('ideas.*, MAX(comments.created_at) as most_recent_comments')
                                    .joins(:comments).order('most_recent_comments desc')
                                    .group('ideas.id').limit(9) }
end
