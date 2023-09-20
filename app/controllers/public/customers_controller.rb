class Public::CustomersController < ApplicationController
  def edit
  end

  def show
    @customer = current_costomer
  end

  def unsubscribe
  end
end
