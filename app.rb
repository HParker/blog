require 'sinatra'

get '/' do
  links = Dir['posts/*.html'].map { |file|
    basename = File.basename(file, ".*")
    "<a href='/read/#{basename}'>#{basename}</a>"
  }

end

get '/read/:filename' do
  send_file "posts/#{params[:filename]}.html"
end
