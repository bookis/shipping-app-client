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
        @service[index] = response[0]
        @cost[index] = Money.new(response[1])
        if response[2].nil?
          @delivery[index] = response[2]
        else
          @delivery[index] = response[2].to_datetime.strftime('%A, %b %e')
        end
        index +=1
      end
    end
  end

end
