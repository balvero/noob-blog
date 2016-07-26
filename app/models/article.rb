class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 120 }
  validates :body, presence: true, length: { minimum: 3 }

end