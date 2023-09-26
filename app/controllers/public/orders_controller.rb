class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all.page(params[:page])
  end

  def show
   @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   if @order.save
     redirect_to public_orders_new_path(@order)
   else 
     render :new
    end
   end
   
   def confirm
  end
  
  private
  def order_params
    params.require(:order).permit(:postcode, :address, :payment_option, :name)
  end

end
