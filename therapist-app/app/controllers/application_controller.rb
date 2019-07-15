require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'sinatra_therapists'
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome # redirect somewhere else? (index?)
    end
  end

  
  helpers do

    def logged_in?
      #should return true if logged in or false if not
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def editable?(client)
      client.user == current_user
    end

  end

  #test
  #test app

end
