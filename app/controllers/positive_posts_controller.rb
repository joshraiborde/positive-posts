class PositivePostsController <  ApplicationController

    get '/positive_posts' do #index
        @positive_posts = PositivePost.all.reverse
    end

    get '/positive_posts/new' do #new entry
        erb :'/positive_posts/new'
    end




    







end