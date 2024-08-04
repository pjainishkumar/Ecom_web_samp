# frozen_string_literal: true

# app/controllers/checkout_controller.rb
class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @cart = session[:cart]
    @cart_items = @cart.map do |product_id, quantity|
      product = Product.find(product_id)
      { product:, quantity: }
    end
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save!

    # Process payment (you would integrate Stripe or another payment processor here)

    # Clear the cart
    session[:cart] = {}

    redirect_to success_checkout_path, notice: 'Order successfully placed!'
  rescue StandardError => e
    flash[:error] = "There was an error processing your order: #{e.message}"
    render :new
  end

  def success; end

  private

  def order_params
    params.require(:order).permit(:address, :payment_method) # Add other attributes as necessary
  end
end
