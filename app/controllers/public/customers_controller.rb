class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_costomer
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
  
  
  def edit
    @customer = current_costomer
  end

  
  def update
  end
  
end
