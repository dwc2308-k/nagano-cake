class Public::CartItemsController < ApplicationController

    def index
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @total = @cart_items.inject(0) { |sum, item| sum + cart_item.subtotal }
    end

    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to request.referer
    end

    def create
        cart_item = CartItem.new(cart_item_params)
        cart_item.customer_id = current_customer.id
        cart_item.item_id = cart_item_params[:item_id]
        if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
            cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
            cart_item.amount += params[:cart_item][:amount].to_i
            cart_item.update(amount: cart_item.amount)
            redirect_to request.referer
        else
            cart_item.save
            redirect_to request.referer
        end
    end
    
    def destroy_all
        CartItem.where(customer_id: current_customer.id).destroy_all
        redirect_to request.referer
    end
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy

        redirect_to request.referer
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end

end
