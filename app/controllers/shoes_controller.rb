require './config/environment'

class ShoesController < ApplicationController

    #I need this to use CRUD

    #Create 
        #-new- creating a new shoe profile.(get '/shoes/new' get request)
        get '/shoes/new' do 
          if logged_in?
           erb :'shoes/new'
          else
            redirect '/login'

          end
        end
        #-create- the form is submitted and the shoe is added to collection (post '/shoes' post request)
        post '/shoes' do
         shoe = Shoes.new(params) #we want to control the saved data. IF its inaccurate or not
         if !shoe.name.empty? && !shoe.description.empty? #checking to make sure form is complete b4 saving.
          shoe.save
          redirect '/shoes'

         else 
          erb :'shoes/new'
         end
        end

    #Read 
      #-index- like and index of ALL the shoes (get '/shoes' get request)

      get '/shoes' do 
        if logged_in?
        @shoes = Shoes.all
        erb :'shoes/index'
        else
         redirect '/login'
        
        end
      end
      #-show- like im SHOWing you what you specifically asked for.(get '/shoes/:id get request)
      get '/shoes/:id' do 
        if logged_in?
        @shoe= Shoes.find(params[:id])
        erb :'shoes/show'
        else  
          redirect '/login'
      end

    #Update

        #-edit-Should render the form to edit shoes (get '/shoes/:id/edit' get request)
        get '/shoes/:id/edit' do
          if logged_in?
          @shoe = Shoes.find(params[:id])
          erb :'shoes/edit'
          else  
            redirect '/login'
        end
      end
        #-update- form is submitted. Make patch request with updated info(patch '/shoes/:id)
        patch '/shoes/:id' do 
          @shoe = Shoes.find(params[:id])
          if params["shoes"]["name"].empty? && params["shoes"]["description"].empty?
          @shoe.update(params["shoes"])
          redirect "shoes/#{params[:id]}"
            else
              @error = "Be sure to fill out the whole form please;)"
            erb :'/shoes/edit'
    
        end
      end

    #Delete
        delete '/shoes/:id' do 
          shoe = Shoes.find(params[:id])
          shoe.destroy
          redirect '/shoes'
        end
end