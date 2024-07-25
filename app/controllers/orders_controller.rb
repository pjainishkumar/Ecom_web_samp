# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_cart_present, only: [:new, :create]

  # Display the checkout form
  def new
    @order = Order.new
    @total_price = calculate_total_price
  end

  # Create an order and process payment
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total_price = calculate_total_price

    if @order.save
      # Clear the cart after successful order creation
      session[:cart] = {}
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # Show the order details
  def show
    @order = Order.find(params[:id])
  end

  private

  # Ensure that there is at least one item in the cart
  def ensure_cart_present
    if session[:cart].blank?
      redirect_to carts_path, alert: 'Your cart is empty. Please add items to your cart before checking out.'
    end
  end

  # Calculate the total price of the items in the cart
  def calculate_total_price
    cart_items = session[:cart].map do |product_id, quantity|
      product = Product.find(product_id)
      product.price * quantity.to_i
    end
    cart_items.sum
  end

  # Strong parameters for order
  def order_params
    params.require(:order).permit(:address, :province)
  end
end
