class OrdersController < ApplicationController

  def show
    @order = Order.find_by(number: params[:number])
    @shipping_info
  end

  def update
    @order = Order.new(params[:id])
    order_form = OrderForm.new(current_order, params[:order])
    if order_form.save
      session[:order_number] = nil
      # @country = params[:country]
      # @state = params[:state]
      # @city = params[:city]
      # @zip = params[:zip]
      request = HTTParty.get("http://localhost:3000/?country=#{@country}&state=#{@state}&city=#{@city}&zip=#{@zip}")
      # http://localhost:3000/quotes/search?country=US&state=MD&city=Baltimore&zip=21231
      @shipping_info = request.parsed_response

      render :update
      @country = @order.country
      raise

      # redirect_to order_path(order_form.order.number)
    end


  end
end
