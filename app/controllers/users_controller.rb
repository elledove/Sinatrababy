class UserController < ApplicationController

    #where people sign up
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do
        user= User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username and password required!"
            erb :'users/signup'

        elsif User.find_by(username: user.username)
            @error = "Looks like that already exists :("
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/shoes'
     end
  end

end