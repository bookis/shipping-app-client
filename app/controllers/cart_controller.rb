class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    if !current_order.address.nil?

      @city = current_order.address.city
      @state = current_order.address.state
      @zip = current_order.address.postal_code

      # FOR UPS
      # could do multi-line concatenation
      @ups_request = HTTParty.get("http://ship-api.herokuapp.com/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=UPS")
      # http://localhost:3000/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=MD&city=Baltimore&zip=21231&carrier=UPS

      @ups_shipping_info = @ups_request.parsed_response


      # @ups_ground_price = @shipping_info["rates"][0]["total_price"]
      # @ups_three_day_select_price = @shipping_info["rates"][1]["total_price"]


      # FOR USPS

      @usps_request = HTTParty.get("http://ship-api.herokuapp.com/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=USPS")
      @usps_shipping_info = @usps_request.parsed_response

      # FOR FEDEX

      @fedex_request = HTTParty.get("http://ship-api.herokuapp.com/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=FEDEX")
      @fedex_shipping_info = @fedex_request.parsed_response


    end
  end
end
