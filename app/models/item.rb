class Item < ApplicationRecord
  enum status:{exhibition: 0, trading: 1, sold: 2}
end
