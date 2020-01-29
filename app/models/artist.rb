class Artist < ApplicationRecord
  
  has_many :artworks
  
  validates :name, presence: true
  
  scope :with_preview_artwork, -> { joins(:artworks).where( artworks: { is_preview: true } ) }
  
  def preview_artwork
    self.artworks.preview
  end
  
  def add_artwork(artwork)
    if self.preview_artwork.empty?
      artwork.is_preview = true
      artwork.save
      self.artworks << artwork
    end
  end
end
