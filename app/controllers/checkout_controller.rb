# app/controllers/checkout_controller.rb
class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = Address.new
  end

  def create
    @order = current_user.orders.create!(
      total_price: cart_total,
      status: 'pending'
    )

    @address = @order.build_address(address_params.merge(user: current_user))
    @address.save!

    session[:cart].each do |product_id, quantity|
      product = Product.find(product_id)
      @order.order_items.create!(
        product: product,
        quantity: quantity,
        price_at_order: product.price
      )
      product.update(stock_quantity: product.stock_quantity - quantity)
    end

    session[:cart] = {}
    redirect_to invoice_path(@order)
  end

  private

  def cart_total
    session[:cart].sum do |product_id, quantity|
      product = Product.find(product_id)
      product.price * quantity
    end
  end

  def address_params
    params.require(:address).permit(:name, :phone, :address_line1, :province, :postal_code)
  end
end