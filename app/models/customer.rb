class Customer < ApplicationRecord
    enum is_deleted: { 退会: 0, 有効: 1 }
end
