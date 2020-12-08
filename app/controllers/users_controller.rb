class UsersController <  ApplicationController

    get '/login' do #render login page form
        erb :login
    end

    post '/login' do #login in form, find user, login user(create a session)
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id #logs in user
            redirect "/users/#{@user.id}"
        else

        end
    end

    get '/signup' do #signup form
        erb :signup
    end

    post '/users' do #create a new user and persist the user to the DB
        if params[:name] != "" && params[:lastname] != "" && params[:email] != "" && params[:password] != "" 
            @user = User.create(params)
            session[:user_id] = @user.id #logs in user
            redirect "/users/#{@user.id}"
        else
            redirect '/signup'
        end

    end

    get '/users/:id' do #user's show route
        @user = User.find_by(id: params[:id])
        
        erb :'/users/show'
    end

    get '/logout' do #logout route
        session.clear
        redirect '/'
    end

end