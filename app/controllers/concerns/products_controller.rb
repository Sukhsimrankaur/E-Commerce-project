class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category, image_attachment: :blob).all
  end

  def show
    @product = Product.find_by(id: params[:id])
    unless @product
      redirect_to products_path, alert: "Product not found."
    end
  end
end
