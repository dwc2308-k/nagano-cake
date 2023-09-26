class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer



    def subtotal
        item.with_tax_price * amount
    end
    
    def get_image(x,y)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [x, y]).processed
    end

end

