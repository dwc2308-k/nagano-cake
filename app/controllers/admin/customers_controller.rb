class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Cutomer.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
end
