class ClientsController < ApplicationController
    #get /new to render form to create new client 
    get '/clients/new' do
        erb :'/clients/new'
    end

    #post clients for create new client info
    post '/clients' do
        # create new and save, only save if there is content and user is logged in
        if !logged_in?
            redirect '/'
        end

        if params[:first_name] != "" && params[:last_name] != "" && params[:date] != "" && params[:preferences] != "" && params[:content] != ""
             #add all required fields
            #create new entry
            @client = Client.create(first_name: params[:first_name], last_name: params[:last_name], date: params[:date], preferences: params[:preferences], content: params[:content], user_id: current_user.id)
            #add all params
            redirect "/clients/#{@client.id}"
        else
            redirect '/clients/new'
        end
    end

    #show page for client
    get '/clients/:id' do
        @client = Client.find(params[:id])
        erb :'/clients/show'
    end

    #client edit page
    get '/clients/:id/edit' do
        erb :'clients/edit'
    end

    #index for clients
end
