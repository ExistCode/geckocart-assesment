class Api::V1::CartsController < ApplicationController
    before_action :authenticate_user
    before_action :set_cart_item, only: [:update_item, :remove_item]

    def show
        if current_user
            @cart = current_user.cart || current_user.create_cart
            render json: @cart, include: :cart_items
            # item = cart.cart_items.new(cart_item_params)
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end    
    end

    def add_item
        cart = current_user.cart || current_user.create_cart
        existing_item = cart.cart_items.find_by(coin_id: cart_item_params[:coin_id])

        if existing_item
            new_quantity = existing_item.quantity + cart_item_params[:quantity].to_f
            if existing_item.update(quantity: new_quantity)
                render json: cart, include: :cart_items
            else
                render json: { errors: existing_item.errors.full_messages }, status: :unprocessable_entity
            end
        else
            item = cart.cart_items.new(cart_item_params)
            if item.save
                render json: cart, include: :cart_items
            else
                render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
            end
        end
    end

    def update_item
        if @cart_item.update(cart_item_params)
            render json: current_user.cart, include: :cart_items
        else
            render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def remove_item
        if @cart_item.destroy
            render json: current_user.cart, include: :cart_items
        else
            render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

     def set_cart_item
        @cart_item = current_user.cart.cart_items.find_by(id: params[:item_id])
        unless @cart_item
            raise ActiveRecord::RecordNotFound.new('Cart item is not found') 
        end
    end

    # Calculate the total amounts
    def total_amount
        cart_items.sum { |item| item.quantity * item.price_at_time}
    end 

    private
    # Item parameters
    def cart_item_params
        params.require(:cart_item).permit(:coin_id, :coin_symbol, :coin_name, :coin_logo, :quantity, :price_at_time)
    end   

end
