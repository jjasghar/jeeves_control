require 'sinatra'

set :bind, '0.0.0.0'
set :port, '1337'

set :root, File.dirname(__FILE__)

get '/' do
  @restart = restart
  @start = start
  @stop = stop
  erb :index
end

get '/restart' do
  `docker restart docker-lita-pa7`
  redirect '/'
end


get '/start' do
  `docker start docker-lita-pa7`
  redirect '/'
end


get '/stop' do
  `docker stop docker-lita-pa7`
  redirect '/'
end

helpers do

  def restart
    "<li><a href='/restart' target='_self'>Restart Jeeves</a></li>"
  end

  def start
    "<li><a href='/start' target='_self'>Start Jeeves</a></li>"
  end

  def stop
    "<li><a href='/stop' target='_self'>Stop Jeeves</a></li>"
  end

end
