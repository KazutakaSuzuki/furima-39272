class AddressesController < ApplicationController

  def index
  end

  def create
    @address = OrderAddress.new(set_paramms)
  end

  private

  def set_params
    params.permit()
  end

end
