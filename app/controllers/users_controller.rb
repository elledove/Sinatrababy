class UserController < ApplicationController

    #where people sign up
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do
        user= User.new(params)
        if user.save
            session[:id]= user.id
            redirect '/shoes'
        else
            @error = "Username and Password Required!"
            erb :'/users/signup'
     end
  end

end