class Comment < ApplicationRecord
  belongs_to :idea, optional: true

  validates :content, presence: { message: "Content must be a minimum of 10 characters long" }, length: { minimum: 10, message: "Content must be a minimum of 10 characters long" }
  validate :validate_idea

  scope :order_by_most_recent, -> {order('created_at desc')}

  def validate_idea
    errors.add(:idea, "Idea must exist") unless self.idea
  end
end
