class Idea < ApplicationRecord
  has_many :comments
  validates :title, presence: { message: "must be a minimum of 5 characters long" }, length: { minimum: 5, message: "must be a minimum of 5 characters long" }
  validates :content, presence: { message: "must be a minimum of 10 characters long" }, length: { minimum: 10, message: "must be a minimum of 10 characters long" }
end
