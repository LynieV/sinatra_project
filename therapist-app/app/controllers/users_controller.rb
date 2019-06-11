class UsersController < ApplicationController

    # what routes and views do I need for login and logout? Signup?

    #this route is to render login page (form)
    get '/login' do
        erb :login
    end

    #creating a session (adding key:value pair to session)
    #receive login form, find and login in user(create session)
    post '/login' do
        #find user
        @user = User.find_by(email: params[:email])
        #authenticate user (email/password combo)
        if @user.authenticate(params[:password])
            #login user (create session)
            session[:user_id] = @user.id
            #redirect to show
            redirect "users/#{@user.id}"
        else
            #tell user info is invalid and redirect to login
        end
    end

        #job of this route is to render signup form
    get '/signup' do
        erb :signup
    end

    post '/users' do
        #create user and persist user to database
        #only if there is a name, email and password
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            #valid input
            @user = User.create(params)
            #where to go now? user show page?
            redirect "/users/#{@user.id}"
            #(erb :"/users/show") redirect is the url, erb(render) is the file
        else
            #not valid input
        end
    end

    #create show route to verify login works
    get '/users/:id' do
        "USER SHOW PAGE"
    end

end
