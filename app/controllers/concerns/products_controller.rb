class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category, image_attachment: :blob)
                       .order(created_at: :desc)
                       .page(params[:page])
                       .per(9)
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

    @products = Product.includes(:category, image_attachment: :blob)

    if @query.present?
      @products = @products.where("name ILIKE ?", "%#{@query.strip}%")
    end

    if @category_id.present?
      @products = @products.where(category_id: @category_id)
    end

    @products = @products.order(created_at: :desc)
                         .page(params[:page])
                         .per(9)

    render :index
  end
end
