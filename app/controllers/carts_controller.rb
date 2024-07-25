# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :initialize_cart

  def show
    @cart = session[:cart]
    @cart_items = @cart.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity }
    end
  end

  def add_to_cart
    product_id = params[:product_id].to_s
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1
    redirect_to cart_path, notice: 'Product added to cart.'
  end

  def remove_from_cart
    product_id = params[:product_id].to_s
    session[:cart].delete(product_id)
    redirect_to cart_path, notice: 'Product removed from cart.'
  end

  def update_quantity
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    if quantity > 0
      session[:cart][product_id] = quantity
    else
      session[:cart].delete(product_id)
    end
    redirect_to cart_path, notice: 'Quantity updated.'
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end
end
