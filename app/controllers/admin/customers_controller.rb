class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.page(params[:page])
    end
    
    def show
        @customer = Cutomer.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
end
