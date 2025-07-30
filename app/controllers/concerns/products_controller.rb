class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category, image_attachment: :blob).all
  end
end
