class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all.page(params[:page])
  end

  def show
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create

  end

end
