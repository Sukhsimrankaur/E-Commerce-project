class CartController < ApplicationController
  def add_to_cart
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    quantity = 1 if quantity < 1

    cart = current_cart

    if cart[product_id]
      cart[product_id] += quantity
    else
      cart[product_id] = quantity
    end

    session[:cart] = cart
    redirect_to products_path, notice: "Product added to cart."
  end

  def show
    @cart_items = []
    current_cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      if product
        @cart_items << { product: product, quantity: quantity }
      end
    end
  end

  def remove_from_cart
    product_id = params[:product_id].to_s
    session[:cart]&.delete(product_id)
    redirect_to cart_path, notice: "Product removed from cart."
  end
end
