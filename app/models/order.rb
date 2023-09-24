class Order < ApplicationRecord
    enum payment_option: { credit_card: 0, transfer: 1 }
end
