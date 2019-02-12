class Order < ApplicationRecord
  belongs_to :product
end

#The second line in our order model sets up the relationship between our orders and our products
