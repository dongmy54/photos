class Photo < ApplicationRecord
  validates :title, presence: true
  validates :tag, inclusion: { in: Tag.pluck(:name),
                               message: "%{value} is invalid tag,tags can only be #{Tag.pluck(:name)}" }
  validates :image , presence: true
  mount_uploader :image, ImageUploader

  

end
