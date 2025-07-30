class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category, image_attachment: :blob).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
