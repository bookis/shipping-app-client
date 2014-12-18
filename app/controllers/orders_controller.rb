class OrdersController < ApplicationController

  def show
    @order = Order.find_by(number: params[:number])

  end

  def update
    order_form = OrderForm.new(current_order, params[:order])
    if order_form.save
      session[:order_number] = nil

      @order = order_form.order


      @city = @order.address.city
      @state = @order.address.state
      @zip = @order.address.postal_code
      @country = "US"

      request = HTTParty.get("http://localhost:3000/?country=#{@country}&state=#{@state}&city=#{@city}&zip=#{@zip}")
      # http://localhost:3000/quotes/search?country=US&state=MD&city=Baltimore&zip=21231

      @shipping_info = request.parsed_response

      redirect_to order_path(order_form.order.number)
    end


  end
end
