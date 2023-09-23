class Customer < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #validates :encrypted_password_confirmation, presence: true
        #validates :encrypted_password, length: { minimum: 1, maximum: 6 }
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :last_name_kana, presence: true
        validates :first_name_kana, presence: true
        #validates :postcode, presence: true , format: { with: /\A\d{10,11}\z/ }
        validates :address, presence: true
        #validates :phone_number, presence: true , format: { with: /\A\d{10,11}\z/ }
        validates :email, presence: true
  enum is_deleted: { 退会: 0, 有効: 1 }

end
