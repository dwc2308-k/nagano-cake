class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def edits
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
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
      @address = Address.find(params[:id])
      if @address.update(address_params)
        flash[:success] = "配送先の変更内容を保存しました。"
        redirect_to public_addresses_path
      else
        flash[:danger] = "配送先の変更内容に不備があります。"
        render :edit
      end
  end

  def destroy
  @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to public_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end
end
