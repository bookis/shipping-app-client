class OrdersController < ApplicationController

  def show
    response = HTTParty.get("http://localhost:3000/shipments/search?country=US&city=Seattle&state=WA&zip=98119").parsed_response
    puts response.inspect
    @order = Order.find_by(number: params[:number])
  end

  def update
    order_form = OrderForm.new(current_order, params[:order])
    if order_form.save
      session[:order_number] = nil
      redirect_to order_path(order_form.order.number)
    end
  end
end
