class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  validates :price_excluding_tax, presence: true, numericality: { only_integer: true, greater_than: 0}



end

