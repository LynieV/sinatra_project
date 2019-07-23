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
        if @user && @user.authenticate(params[:password])
            #login user (create session)
            session[:user_id] = @user.id
            #redirect to show
            redirect "users/#{@user.id}"
        else
            #redirect to signup
            redirect to '/signup'
        end
    end

        #job of this route is to render signup form
    get '/signup' do
        erb :signup
    end

    # post '/users' do
    #     #create user and persist user to database
    #     #only if there is a name, email and password
    #     if params[:name] != "" && params[:email] != "" && params[:password] != "" && !User.find_by(email: params[:email])

    #         #valid input
    #         #@user = User.create(params)
    #         @user = User.new(name: params[:name], email: params[:email], password: params[:password]) #retrieve name, email, and password from form and create new user 
    #         @user.save

    #         session[:user_id] = @user.id #automatically log in when signed up
    #         #where to go now? user show page?
    #         redirect "/users/#{@user.id}"
    #         #(erb :"/users/show") redirect is the url, erb(render) is the file
    #     else
    #         #not valid input
    #         #include a message to explain problem?
    #         redirect '/signup'
    #     end
    # end

    post '/users' do #users signup with email and password only
        if params[:name] == "" || params[:email] == "" || params[:password] == "" || User.find_by(email: params[:email]) #check if email and password fields are blank
          redirect to '/signup'
        else
          @user = User.new(name: params[:name], email: params[:email], password: params[:password]) #retrieve name, email, and password from form and create new user 
          @user.save
          session[:user_id] = @user.id #login the user by enabling a session
          redirect "/users/#{@user.id}" #redirect logged in user 
        end
      end
    

    #create show route to verify login works
    get '/users/:id' do
        @user = User.find_by(id: params[:id])

        erb :"/users/show"
    end

    #if logged in, how to log out - end session...
    get '/logout' do
        session.clear
        redirect '/'
    end

end
