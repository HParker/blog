require "sinatra/base"

class Blog < Sinatra::Base
  get '/' do
    "HELLO THIS IS ADAM"
  end
end
