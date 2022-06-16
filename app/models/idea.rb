class Idea < ApplicationRecord
  has_many :comments
  validates :title, presence: { message: "Title must be a minimum of 5 characters long" }, length: { minimum: 5, message: "Title must be a minimum of 5 characters long" }
  validates :content, presence: { message: "Content must be a minimum of 10 characters long" }, length: { minimum: 10, message: "Content must be a minimum of 10 characters long" }
end
