class PokemonsController < ApplicationController

  def show
    render json: {
      message: "OK"
    }
  end

end
