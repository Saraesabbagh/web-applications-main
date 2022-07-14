require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
    @name = params[:name]
    if @name.match(/[^aA-zZ]/) == nil
      return erb(:hello)
    else 
      return "invalid entry"
    end

  end
  # def invalid_request_parameters?
  #   return (params[:name] == nil || params[:name].include?("[^a-zA-Z]"))
  # end
end

# post "/albums" do
#     if invalid_request_parameters?
#       status 400
#       return ''
#     end

#     repo = AlbumRepository.new
#     album = Album.new    
#     album.title = params[:title]
#     album.release_year = params[:release_year]
#     album.artist_id = params[:artist_id]

#     repo.create(album)
#     return "Your album has been added!"

#     def invalid_request_parameters?
#       return (params[:title] == nil || params[:release_year] == nil || params[:artist_id] == nil)
#     end
#   end
# >','?','/','.',',','!','@