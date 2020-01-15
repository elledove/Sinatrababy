class SessionsController <ApplicationController

#login in and be able to log out
get '/login' do 
    erb :'users/login'
end

post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username and password required!"
            erb :'users/login'
        elsif
          user = User.find_by(username: params["username"], password: params["password"])
          session[:user_id] = user.id
          redirect '/shoes'
            
        else
            @error = "Hmm...We can't seem to find you. :/ Try Again?"
            erb :'users/login'

     end
  end

  get 'logout' do
session.clear
redirect '/'
  end
end