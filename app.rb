require 'sinatra'

class Blog < Sinatra::Base
  get '/' do
    "HELLO THIS IS ADAM"
=begin
    links = Dir['posts/*.html'].map { |file|
      basename = File.basename(file, ".*")
      "<a href='/read/#{basename}'>#{basename}</a>"
    }
=end
  end
=begin
  get '/read/:filename' do
    send_file "posts/#{params[:filename]}.html"
  end
=end
end
