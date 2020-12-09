class PositivePostsController <  ApplicationController

    get '/positive_posts' do #index
        @positive_posts = PositivePost.all.reverse
        erb :'positive_posts/index'
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
        set_positive_post
        erb :'/positive_posts/show'
    end

    get '/positive_posts/:id/edit' do #render edit form
        set_positive_post
        if logged_in?
            if authorized_to_edit?(@positive_post)
                erb :'/positive_posts/edit'
            else
                redirect "users/#{@current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/positive_posts/:id' do #find entry, update and redirect to show page
        set_positive_post
        if logged_in?
            if @positive_post.user == current_user && params[:title] != "" && params[:text] != ""
                @positive_post.update(title: params[:title], text: params[:text])
                redirect "/positive_posts/#{@positive_post.id}"
            else
                redirect "users/#{@current_user.id}"
            end
        else
            redirect '/'
        end
      end

      delete '/positive_posts/:id' do #deletes authorized user's post
        set_positive_post
        if authorized_to_edit?(@positive_post)
            @positive_post.destroy
            redirect '/positive_posts'
        else
            redirect '/positive_posts'
        end
      end

# index route for all entries
private
    def set_positive_post
        @positive_post = PositivePost.find(params[:id])
    end

end