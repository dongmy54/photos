class Photo < ApplicationRecord
  validates :title, presence: true
  validates :tag, inclusion: { in: %w(empty family animals children),
                               message: "%{value} is not a valid tag,the tag is only empty/family/animals/children" }
  validates :image , presence: true
  mount_uploader :image, ImageUploader
end
