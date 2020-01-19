require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'just some stuff'
    set :public_folder, 'public'
    set :views, 'app/views'
    
  end

  get "/" do
    erb :welcome #Will welcome them to page w/ option to login/signup
  end

  def current_user
   @user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user #checks for truthiness based on current user.
  end

   def require_login
    unless logged_in?
      redirect '/login'
   end
end
end


