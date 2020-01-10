require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome #Will welcome them to page w/ option to login/signup
  end

    get "/signup" do #this is where they are shown the form.
      #erb: signup
    end

    post "/signupform" do
    #erb: form 
   end

   get "login" do 
   # erb: 
   end

   get '/index' do
    erb :index
   # "boss bane"
   end

end
