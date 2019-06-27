class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :text, ImageUploader
end
