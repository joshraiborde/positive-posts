class UsersController <  ApplicationController

    get '/login' do #render login page form
        erb :login
    end

    post '/login' do #login in form, find user, login user(create a session)
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id #logs in user
            flash[:message] = "Welcome, #{@user.firstname.capitalize} #{@user.lastname.capitalize}!"
            redirect "/users/#{@user.id}"
        else
            flash[:errors] = "Uh-oh. Either the Email and/or Password is incorrect. Please try again or Sign Up."
            redirect '/login'
        end
    end

    get '/signup' do #signup form
        erb :signup
    end

    post '/users' do #create a new user and persist the user to the DB
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id #logs in user
            flash[:message] = "Congrats! #{@user.firstname.capitalize} #{@user.lastname.capitalize}, you have created a PositivePost Account!"
            redirect "/users/#{@user.id}"
        else
            flash[:errors] = "Uh-Oh. We weren't able to make an account because #{@user.errors.full_messages.to_sentence}"
            redirect '/signup'
        end
    end

    get '/users/:id' do #user's show route
        @user = User.find_by(id: params[:id])
        redirect_if_not_logged_in
        erb :'/users/show'
    end

    get '/logout' do #logout route
        session.clear
        redirect '/'
    end

    # private
    # def full_name
    #     "#{@user.firstname.capitalize}
    #     #{@user.lastname.capitalize}"
    #   end


end