class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def unsubscribe
  end

  def withdraw
  end


  def edit
    @customer = current_customer
  end


  def update
     @customer = current_customer
     @customer.update
     redirect_to public_customers_mypage_path(@customer)
  end

end
