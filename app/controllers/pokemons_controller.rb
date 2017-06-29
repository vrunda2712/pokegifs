class PokemonsController < ApplicationController

  def show
      res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
      body = JSON.parse(res.body)

      res_gif = Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_KEY']}&q=pikachu&rating=g", followlocation: true)
      body_gif = JSON.parse(res_gif.body)

      render json: {
        url: body_gif["data"][0]["embed_url"],
        id: body["id"],
        name: body["name"],
        type: body["types"][0]['type']['name']
        # results:[
        #   body["id"],body["name"],body["types"][0]['type']['name']
        # ]
      }
  end

end
