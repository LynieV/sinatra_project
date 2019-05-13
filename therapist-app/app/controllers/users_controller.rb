class UsersController < ApplicationController

    # what routes and views do I need for login and logout? Signup?

    #this route is to render login page (form)
    get '/login' do
        erb :login
    end

    get '/signup' do

    end

end
