# frozen_string_literal: true

# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create index]
  before_action :ensure_cart_present, only: %i[new create]
  after_action :send_confirmation_sms, only: %i[create]

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
      flash[:success] = 'Order was successfully created.'
      # Clear the cart after successful order creation
      session[:cart] = []
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # Show the order details
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  private

  def send_confirmation_sms
    TwilioSmsSender.new(
      to: customer_phone_number,
      body: "Your order ##{@order.id} has been placed successfully!"
    ).call
  end

  def customer_phone_number
    # Replace this with the actual way to get the customer's phone number
    current_user.phone_number rescue '91-123456789' 
  end

  # Ensure that there is at least one item in the cart
  def ensure_cart_present
    return unless session[:cart].blank?

    redirect_to carts_path, alert: 'Your cart is empty. Please add items to your cart before checking out.'
  end

  def order_params
    params.require(:order).permit(:address, :province, :payment_method, :total_price)
  end

  # Calculate the total price of the items in the cart
  def calculate_total_price
    cart_items = session[:cart].map do |product_id, quantity|
      product = Product.find(product_id)
      product.price * quantity.to_i
    end
    cart_items.sum
  end
end
