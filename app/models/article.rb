class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 120 }
  validates :body, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true

end