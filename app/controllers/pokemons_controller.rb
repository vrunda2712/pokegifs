class PokemonsController < ApplicationController

  def show
      res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
      body = JSON.parse(res.body)

      render json: {
        "id": body["id"],
        "name": body["name"],
        "type": body["types"][0]['type']['name']
        # results:[
        #   body["id"],body["name"],body["types"][0]['type']['name']
        # ]
      }
  end

end
