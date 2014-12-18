class AddressesController < ApplicationController
  def create
    @address = current_order.build_address(params.require(:address).permit!)
    if @address.save
      redirect_to cart_path
    end
  end
end
