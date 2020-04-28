
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {all_gossips_array: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end
end