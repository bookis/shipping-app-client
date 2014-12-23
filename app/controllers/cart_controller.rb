class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    @order = current_order
    @products = @order.products.to_a
    @weights = @products.map { |product| product.weight }
    @weight = @weights.inject{ |sum, x| sum + x }
    if @order.address
      query_hash = {
        weight: @weight,
        destination: {
        city:    @order.address.city,
        zip:     @order.address.postal_code,
        state:   @order.address.state,
        country: 'US'}}
      response = HTTParty.get('http://obscure-crag-2178.herokuapp.com/search', query: query_hash).parsed_response
      if response['response']['status'] == 'bad_request'
        parse_error(response)
      else
        @rates = response['response'].sort_by! { |rate| rate[1] }
      #  raise
      end
    end
  #  ups_request(@weight, )

  end

  private

  def parse_error(resp)
    case resp['response']['reason']
      when 'weight'
        @error = 'the weight of your order.'
      when 'address'
        @error = 'the address you provided is not valid.'
    end
  end

end
