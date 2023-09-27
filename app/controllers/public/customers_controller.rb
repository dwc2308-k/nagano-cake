class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  def edit
    @customer = current_customer
    @customers = Customer.all
  end


  def update
     @customer = current_customer
     @customer.update(customer_params)
     redirect_to public_customers_mypage_path
  end
  
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
    end

end
