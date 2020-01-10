require './config/environment'

class ShoesController < Sinatra::Base

    #I need this to use CRUD

    #Create 
        #-new- creating a new shoe profile.(get '/shoes/new' get request)
        #-create- the form is submitted and the shoe is added to collection (post '/shoes' post request)

    #Read 
      #-index- like and index of ALL the shoes (get '/shoes' get request)

      get '/shoes' do 
        @shoes = Shoes.all
        erb :index
      end
      #-show- like im SHOWing you what you specifically asked for.(get '/shoes/:id get request)

    #Update

        #-edit-Should render the form to edit shoes (get '/shoes/:id/edit' get request)
        #-update- form is submitted. Make patch request with updated info(patch '/shoes/:id)

    #Delete

end