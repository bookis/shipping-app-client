class Estimate

  attr_accessor :cost, :service, :delivery

  def initialize(params)
    @response = HTTParty.get("http://localhost:3000/shipments/search?country=#{params[:country]}&city=#{params[:city]}&state=#{params[:state]}&zip=#{params[:zip]}").parsed_response
    @cost = Money.new(@response["ups"]["rates"].first["total_price"])
    @service = @response["ups"]["rates"].first["service_name"]
    raise
    @delivery = @response["ups"]["rates"].first["delivery_range"].first.to_datetime.strftime('%A, %b %e')
  end

end
