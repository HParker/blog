require "sinatra/base"

class Blog < Sinatra::Base
  get '/' do
    erb :index, locals: { posts: Dir['posts/**/*.html'].map { |post| { name: File.basename(post, '.html'), time: File.atime(post) } } }
  end
  get '/read/:name' do
    send_file "posts/#{params[:name]}.html"
  end
end
