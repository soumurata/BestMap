class AddressesController < ApplicationController
  def new
    @address = current_user.address.new
  end

  def create
    @address = current_user.address.new(address_params)
  end

  private
  
  def address_params
    params.require(:address).permit(:name, :lat, :lng)
  end
end
