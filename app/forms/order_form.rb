class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    @order.build_credit_card(params.require(:credit_card).permit!)
  end

  def save
    @order.save
  end

end
