require './config/environment'

class ShoesController < ApplicationController

    before do 
      require_login
    end

    #Create 
        #-new- creating a new shoe profile.(get '/shoes/new' get request)
        get '/shoes/new' do 
          erb :'shoes/new'
        end
        #-create- the form is submitted and the shoe is added to collection (post '/shoes' post request)
        post '/shoes' do
          custom_params = params.reject{|key,value|key == "image" && value.empty?} #we dont want to require image
          shoe = current_user.shoes.build(custom_params) #prevents just anyone making changes. has to be current user
         user.image = nil if user.image.empty?
          if shoe.save 
           redirect '/shoes'

         else 
           @error = "Try Again?"
           erb :'shoes/new'
          end
        end

    #Read 
      #-index- like and index of ALL the shoes (get '/shoes' get request)

      get '/shoes' do 
        @shoes = Shoes.all
        erb :'shoes/index'
  
      end
      #-show- like im SHOWing you what you specifically asked for.(get '/shoes/:id get request)
      get '/shoes/:id' do 
        @shoe = Shoes.find_by(id: params[:id])
        if @shoe 
        erb :'shoes/show'
        else  

          redirect :'/shoes'
        end
      
    end

    #Update

        #-edit-Should render the form to edit shoes (get '/shoes/:id/edit' get request)
        get '/shoes/:id/edit' do
          @shoe = Shoes.find(params[:id])
          erb :'shoes/edit'
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