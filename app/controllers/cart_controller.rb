class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show



    # @city = @order.address.city
    # @state = @order.address.state
    # @zip = @order.address.postal_code
    # @country = "US"
    #
    # request = HTTParty.get("http://localhost:3000/?country=#{@country}&state=#{@state}&city=#{@city}&zip=#{@zip}")
    # # http://localhost:3000/quotes/search?country=US&state=MD&city=Baltimore&zip=21231
    #
    # @shipping_info = request.parsed_response
  end
end
