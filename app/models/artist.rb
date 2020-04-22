class Artist < ApplicationRecord
  before_save :parse_name
  
  has_many :artworks, dependent: :destroy
  
  validates :full_name, presence: true
  
  scope :with_preview_artwork, -> { joins(:artworks).where( artworks: { is_preview: true } ) }
  
  scope :with_artworks, -> { joins(:artworks) }
  
  scope :not_categories, -> { where(is_category: false) }
  
  scope :categories, -> { where(is_category: true) }
  
  def preview_artwork
    self.artworks.preview
  end
  
  def add_artwork(artwork)
    if self.preview_artwork.empty?
      artwork.is_preview = true
      artwork.save
    end
  end
  
  def parse_name
    if self.first_name.nil?
      name_array = self.full_name.split(' ')
      self.first_name = name_array.first
      self.last_name = name_array.last
    end
  end
end
