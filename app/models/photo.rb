class Photo < ApplicationRecord
  validates :title, presence: true
  validates :tag, inclusion: { in: %w(empty family animals children),
                               message: "%{value} is not a valid tag" }
end
