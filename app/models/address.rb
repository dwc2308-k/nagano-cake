class Address < ApplicationRecord

  belongs_to :customer
  validates :postcode
  validates :address
  validates :name

end
