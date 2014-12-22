class Estimate

  attr_accessor :cost, :service, :delivery

  def initialize(params)
    @response = HTTParty.get("http://localhost:3000/shipments/search?country=#{params[:country]}&city=#{params[:city]}&state=#{params[:state]}&zip=#{params[:zip]}").parsed_response
    @cost = []
    @service = []
    @delivery = []

    index = 0

    @response.keys.each_with_index do |key, j|
      @response[key].each do |response|
        if response[2].nil?
          @delivery[index] = nil
          @service[index] = nil
          @cost[index] = nil
        else
          @delivery[index] = response[2].to_datetime.strftime('%A, %b %e')
          @service[index] = response[0]
          @cost[index] = Money.new(response[1])
        end

        index +=1
      end
    end
    
    @delivery.compact!
    @service.compact!
    @cost.compact!
  end

end
