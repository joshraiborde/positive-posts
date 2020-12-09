require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "positive"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    end
    erb :welcome
  end

  helpers do
    
    def logged_in? #should return true if the user is logged in, or false if the user isn't logged in.
      !!current_user
    end

    def current_user
      @current_user ||=User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(positive_post)
      positive_post.user == current_user
    end

  end



end
