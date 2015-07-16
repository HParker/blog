require "sinatra/base"
require './models/post'

class Blog < Sinatra::Base
  get '/' do
    erb :index, locals: { posts: Models::Post.all }
  end

  get '/read/:name' do
    send_file "posts/#{params[:name]}.html"
  end
end
