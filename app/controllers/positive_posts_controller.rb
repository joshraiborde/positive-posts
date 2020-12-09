class PositivePostsController <  ApplicationController

    get '/positive_posts' do #index
        @positive_posts = PositivePost.all.reverse
    end

    get '/positive_posts/new' do #new entry form
        erb :'/positive_posts/new'
    end

    post '/positive_posts' do #create a new entry
        if !logged_in?
            redirect '/'
        end
        if params[:title] != "" && params[:text] != ""
            @positive_post = PositivePost.create(title: params[:title], text: params[:text], user_id: current_user.id)
            redirect "/positive_posts/#{@positive_post.id}"
        else
            redirect '/positive_posts/new'
        end
    end

    get '/positive_posts/:id' do #show route
        @positive_post = PositivePost.find(params[:id])
        erb :'/positive_posts/show'
    end

    get '/positive_posts/:id/edit' do #render edit form
        erb :'/positive_posts/edit'
    end


end