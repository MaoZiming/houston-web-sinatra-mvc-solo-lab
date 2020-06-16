class PuppiesController < ApplicationController
   

    set :views, "app/views"
    set :method_override, true

    get '/index' do

        erb :index
    end
end