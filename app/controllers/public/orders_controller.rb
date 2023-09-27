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
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to public_orders_new_path(@order)
   else 
    render :new
   end
  end
   
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @total = 0
    if params[:order][:select_address] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end
      
  end

  
  private
  def order_params
    params.require(:order).permit(:postcode, :address, :payment_option, :name, :customer_id)
  end

end
