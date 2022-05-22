require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Lets Goo!'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse_each
    erb :'peeps' 
  end

  post '/peeps/add' do 
    Peep.create(content: params[:peep_content], user_id: 1)
    redirect '/peeps'
  end  

  run! if app_file == $0
end