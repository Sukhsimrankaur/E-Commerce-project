module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_product, only: [:edit, :update, :destroy]

    def index
      @products = Product.all.includes(:category)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: "Product created successfully."
      else
        render :new
      end
    end

    def edit
    end

    def update
  if params[:product][:remove_image] == "1"
    @product.image.purge
  end

  if @product.update(product_params.except(:remove_image))
    redirect_to admin_products_path, notice: "Product updated successfully."
  else
    render :edit
  end
    end

    def destroy
      @product = Product.find_by(id: params[:id])
      if @product
        @product.destroy
        redirect_to admin_products_path, notice: "Product deleted successfully."
      else
        redirect_to admin_products_path, alert: "Product not found."
      end
    end


    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :sku, :price, :stock_quantity, :category_id, :image, :remove_image)
    end

    def require_admin
      redirect_to root_path, alert: "Access denied" unless current_user.role == "admin"
    end
  end
end
