class AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def edit
  end

  def create
    @address = ShipCity.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "You have created address successfully."
      redirect_to public_addresses_path
    else
      @addresses = current_customer.addresses
      render 'index'
    end
  end

  def update
  end

  def destroy
  end


end
