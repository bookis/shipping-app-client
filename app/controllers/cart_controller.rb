class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    if current_order.address
      params = { country: "US", city: current_order.address.city, state: current_order.address.state, zip: current_order.address.postal_code }
      @estimate = Estimate.new(params)
    end
  end

end
