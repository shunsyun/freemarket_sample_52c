class Item < ApplicationRecord
  enum status:{exhibition: 0, trading: 1, sold: 2}
  has_many :images
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  belongs_to :prefecture
end
