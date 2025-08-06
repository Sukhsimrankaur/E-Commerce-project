class OrdersController < ApplicationController
  def invoice
    @order = Order.find(params[:id])
  end
end