class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  validates :price_excluding_tax, presence: true, numericality: { only_integer: true, greater_than: 0}
  
  def get_image(x,y)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [x, y]).processed
    
  end
  
    def with_tax_price
      (price_excluding_tax * 1.1).floor
    end


end

