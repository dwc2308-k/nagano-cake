class Admin::HomesController < ApplicationController
    
    has_many :orders
    has_many :order_details
    
    def top
        @order = Order.all
        
    end
end
