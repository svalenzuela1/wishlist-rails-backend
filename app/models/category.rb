class Category < ApplicationRecord
  #model association
  has_many :products, dependent: :destroy

  #validation
  validates_presence_of :name
end
