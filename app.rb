require "sinatra/base"

class Blog < Sinatra::Base
  get '/' do
    erb :index
  end
end
