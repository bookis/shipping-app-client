class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    options = {
      origin:
        {
          country:  'US',
          state:  'CA',
          city:  'Beverly Hills',
          zip:  '90210'
        },
      destination:
        {
          country: 'US',
          state: 'WA',
          city:  'Seattle',
          zip:  '98122'
        },
      package: { weight: 100, dimensions: [5, 7, 6] } }

    # HTTParty.post("http://shipalot.herokuapp.com/ups.json", body: options.to_json, headers: {'Content-Type' => 'application/json'})
    @estimate = HTTParty.get("http://localhost:3000/ups.json", body: options.to_json)
  end
end
