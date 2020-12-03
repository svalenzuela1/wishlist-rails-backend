class Product < ApplicationRecord
  #model association
  belongs_to :category
  belongs_to :wishlist

  #validation
  validates_presence_of :name

  #scope methods
  scope :sort_by_price, -> {order("price ASC")}
end
