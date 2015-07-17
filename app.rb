require "sinatra/base"
require './models/post'

class Blog < Sinatra::Base
  get '/' do
    erb :index, locals: { posts: Models::Post.all }
  end

  get '/read/reveal.js/*.*' do
    puts File.expand_path('reveal.js-3.1.0/' + params['splat'].join('.'), settings.public_folder)
    send_file File.expand_path('reveal.js-3.1.0/' + params['splat'].join('.'), settings.public_folder)
  end

  get '/read/:name' do
    send_file "posts/#{params[:name]}.html"
  end
end
