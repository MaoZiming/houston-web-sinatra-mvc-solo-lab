class ApplicationController < Sinatra::Base
    
    configure do
      set :views, 'app/views'
      set :method_override, true
    end
    
    get '/' do
      erb :welcome
    end

    get '/puppies' do 
      @puppies = Puppy.all
      erb :index
    end
    
    post '/puppies' do
      puppy = Puppy.create(params)
      redirect "/puppies/#{puppy.id}"
    end

    get '/puppies/new' do
      erb :new
    end

    get '/puppies/:id/edit' do
      @puppy = Puppy.find(params[:id])
      erb :edit
    end

    get '/puppies/:id' do
      @puppy = Puppy.find(params[:id])
      erb :show
    end

    patch '/puppies/:id' do
      puppy = Puppy.find(params[:id])
      puppy.update(name: params[:name], breed: params[:breed])
      redirect "/puppies/#{puppy.id}"
    end
    delete '/puppies/:id' do
      puppy = Puppy.find(params[:id])
      puppy.destroy
      redirect '/puppies'
    end
       
end
