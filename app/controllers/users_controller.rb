class UsersController <  ApplicationController

    get '/login' do #render login page form
        erb :login
    end

    #login in form, find user, login user(create a session)
    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id #logs in user
            redirect "users/#{@user.id}"
        else

        end
    end

    get '/signup' do
        
    end

    get '/users/:id' do
        "users show route"
    end

end