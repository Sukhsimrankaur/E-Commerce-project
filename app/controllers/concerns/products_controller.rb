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

  def search
    @query = params[:query]
    @category_id = params[:category_id]

    @products = Product.all

    if @query.present?
      @products = @products.where("name ILIKE ?", "%#{@query}%")
    end

    if @category_id.present?
      @products = @products.where(category_id: @category_id)
    end

    @products = @products.includes(:category).order(created_at: :desc)
    render :index
  end
end
