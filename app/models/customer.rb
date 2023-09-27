class Customer < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :addresses
          has_many :cart_items
          has_many :orders
          

        #validates :encrypted_password_confirmation, presence: true
        #validates :encrypted_password, length: { minimum: 1, maximum: 6 }
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :last_name_kana, presence: true
        validates :first_name_kana, presence: true
        validates :postcode, presence: true
        validates :address, presence: true
        validates :phone_number, presence: true
        validates :email, presence: true

  #enum is_deleted: { false: 0, true: 1 }
  #enum is_deleted: { 退会: 0, 有効: 1 }
  
  #def active_for_authentication?
    #super && (self.is_deleted?)
  #end

end

