class PositivePostsController <  ApplicationController

    get '/positive_posts' do #index
        @positive_posts = PositivePost.all.reverse
    end

    get '/positive_posts/new' do #new entry
        erb :'/positive_posts/new'
    end

    post '/positive_posts' do
        if !logged_in?
            redirect '/'
        else
            if params[:title] != "" && params[:text] != ""
                @positive_post = PositivePost.create(title: params[:title], text: params[:text], user_id: current_user.id)
                redirect "/positive_posts/#{@positive_post.id}"
            else
                redirect '/positive_posts/new'
            end
        end
    end




    







end