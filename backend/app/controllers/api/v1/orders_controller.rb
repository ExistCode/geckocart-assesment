class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders.includes(:order_items)
    render json: orders, include: :order_items
  end

  def create
  cart = current_user.cart
  selected_items = params[:selected_items] || []
  
  if cart.nil? || selected_items.empty?
    raise ActiveRecord::RecordNotFound.new('No items selected') 
  end

  ActiveRecord::Base.transaction do
    selected_cart_items = cart.cart_items.where(id: selected_items)
    total = selected_cart_items.sum { |item| item.quantity * item.price_at_time }

    @order = current_user.orders.create!(
      order_number: "ORD-#{Time.current.to_i}",
      total_amount: total,
      status: 'completed'
    )

    selected_cart_items.each do |item|
      @order.order_items.create!(
        coin_id: item.coin_id,
        coin_symbol: item.coin_symbol,
        coin_name: item.coin_name,
        coin_logo: item.coin_logo,
        quantity: item.quantity,
        price_at_time: item.price_at_time
      )
      item.destroy!
    end

    cart.destroy! if cart.cart_items.empty?
    render json: @order, include: :order_items
  end

  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

end
