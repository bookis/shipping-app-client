class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    @order.build_credit_card(params.require(:credit_card).permit!)
    @city = @order.address.city
    @state = @order.address.state
    @zip = @order.address.postal_code
    if params[:shipment][:carrier] == "UPS Ground"
      @ups_request = HTTParty.get("http://localhost:3000/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=UPS")
      @ups_shipping_info = @ups_request.parsed_response
      Shipment.create(carrier: "UPS Ground", cost: @ups_shipping_info[0][1], order_id: @order.id)
    elsif params[:shipment][:carrier] == "FedEx Ground Home Delivery"
      @fedex_request = HTTParty.get("http://localhost:3000/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=FEDEX")
      @fedex_shipping_info = @fedex_request.parsed_response
      Shipment.create(carrier: "FedEx Ground Home Delivery", cost: @fedex_shipping_info[0][1], order_id: @order.id)
    elsif params[:shipment][:carrier] == "USPS First-Class Mail Parcel"
      @usps_request = HTTParty.get("http://localhost:3000/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=USPS")
      @usps_shipping_info = @usps_request.parsed_response
      Shipment.create(carrier: "USPS First-Class Mail Parcel", cost: @usps_shipping_info[0][0], order_id: @order.id)
    elsif params[:shipment][:carrier] == "USPS Priority Mail 2-Day"
      @usps_request = HTTParty.get("http://localhost:3000/quotes/search?origincountry=US&originstate=WA&origincity=Seattle&originzip=98121&country=US&state=#{@state}&city=#{@city}&zip=#{@zip}&carrier=USPS")
      @usps_shipping_info = @usps_request.parsed_response
      Shipment.create(carrier: "USPS First-Class Mail Parcel", cost: @usps_shipping_info[4][0], order_id: @order.id)
    end
  end

  def save
    @order.save
  end

end
