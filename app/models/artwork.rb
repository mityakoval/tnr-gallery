class Artwork < ApplicationRecord
  
  has_one_attached :picture
  
  validates :name, presence: true
  
  validates :picture, presence: true
end
