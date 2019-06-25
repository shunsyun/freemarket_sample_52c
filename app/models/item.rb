class Item < ApplicationRecord
  enum status:{exhibition: 0, trading: 1, sold: 2}
  # attr_accessor :images_attributes, :image_id

  # belongs_to :image
  has_many :images
  # belongs_to :category
  # belongs_to :brand
  # belongs_to :user
  # belongs_to :prefecture

  # mount_uploader :text, ImageUploader
  accepts_nested_attributes_for :images
  
  scope :recent, -> {order('id DESC').limit(4)}
end
