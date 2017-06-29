class PokemonsController < ApplicationController

  def show
      res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/pikachu/", followlocation: true)
      body = JSON.parse(res.body)

      render json: {
        results:[
          body["id"],body["name"],body["types"][0]['type']['name']
        ]
      }
  end

end
