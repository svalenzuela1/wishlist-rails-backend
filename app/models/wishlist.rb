class Wishlist < ApplicationRecord
  belongs_to :user

  has_many :products, dependent: :destroy

  validates_presence_of :name
end
