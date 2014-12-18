class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      response = HTTParty.get("http://localhost:3000/shipments/search?country=US&city=Seattle&state=WA&zip=98119").parsed_response
      @estimate = Estimate.new(response)
      puts response.inspect
      redirect_to cart_path
    end
  end

  def show
  end
end
