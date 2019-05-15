class UsersController < ApplicationController

    # what routes and views do I need for login and logout? Signup?

    #this route is to render login page (form)
    get '/login' do
        erb :login
    end

    #creating a session (adding key:value pair to session)
    #receive login form, find and login in user(create session)
    post '/login' do

    end

    get '/signup' do

    end

end
