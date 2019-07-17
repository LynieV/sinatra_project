class ClientsController < ApplicationController

    get '/clients' do
        @clients = Client.all
        erb:'clients/index'
    end

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
        set_client
        erb :'/clients/show'
    end

    #client edit page
    #goes to clients/edit to render edit form
    get '/clients/:id/edit' do
        set_client
        if logged_in?
            if editable?(@client)
                erb :'/clients/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end 
    end

    #
    patch '/clients/:id' do
        #find, then update client, then redirect to show?
        set_client #find client
        if logged_in?
            if editable?(@client)
                #update
                @client.update(first_name: params[:first_name], last_name: params[:last_name], date: params[:date], preferences: params[:preferences], content: params[:content])
                redirect "/clients/#{@client.id}"
            else 
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    delete '/clients/:id' do
        set_client
        if editable?(@client)
            @client.destroy
            redirect '/clients'
        else
            redirect '/clients'
        end
    end

    

    private

    #helper method for clients_controller class
    def set_client
        @client = Client.find(params[:id])
    end
end
