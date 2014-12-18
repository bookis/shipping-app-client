class Estimate

  attr_accessor :cost, :service, :delivery

  def initialize(response)
    @cost = response["ups"]["rates"].first["total_price"]
    @service = response["ups"]["rates"].first["service_name"]
    # @delivery = response["ups"]["rates"].first["delivery_date"]
  end

end
