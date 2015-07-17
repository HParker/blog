require "sinatra/base"
require './models/post'

class Blog < Sinatra::Base
  get '/' do
    erb :index, locals: { posts: Models::Post.all }
  end

  get '/present/reveal.js/*.*' do
    send_file File.expand_path('reveal.js-3.1.0/' + params['splat'].join('.'), settings.public_folder)
  end

  get '/read/:name' do
    send_file "posts/#{params[:name]}.html"
  end

  get '/present/:name' do
    send_file "slides/#{params[:name]}.html"
  end
end
