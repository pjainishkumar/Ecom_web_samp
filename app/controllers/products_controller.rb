# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @categories = Category.all.pluck(:name)
    @products = Product.all

    @products = @products.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?

    @products = @products.where(category: params[:category]) if params[:category].present?

    if params[:filter].present?
      case params[:filter]
      when 'on_sale'
        @products = @products.where(on_sale: true)
      when 'new'
        @products = @products.where(new: true)
      when 'recently_updated'
        @products = @products.where(updated_at: 3.days.ago..Date.today).order(updated_at: :desc)
      end
    end

    @products = @products.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
