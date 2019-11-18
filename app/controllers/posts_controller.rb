class PostsController < ApplicationController
  
    get '/posts/new'do
     @current_user# = User.find_by(:username => session[:username]) if session[:username]
    erb :posts
  end
  
    post '/posts' do
     @post = Post.new
    @post.user_id  = current_user.id
    @post.name  = params[:name]
    @post.prepare  = params[:prepare]
    @post.region  = params[:region]
    @post.aroma  = params[:aroma]
    @post.flavour  = params[:flavour]
    @post.acidity  = params[:acidity]
    @post.body  = params[:body]
    @post.food  = params[:food]
    @post.notes  = params[:notes]
    if @post.save
       redirect "/posts/#{@post.id}"
       binding.pry
    end
  end
  
    get '/posts/:id' do
      #@current_user = User.find_by(:username => session[:username]) if session[:username]
      @post = Post.find_by(id: params[:id])
    erb :show

  end
 
 get '/edit' do
  erb :edit
end 
  
  get '/posts/:id/edit' do
    #current_user = User.find_by(:username => session[:username]) if session[:username]
     @post = Post.find_by(id: params[:id])
      if @post == current_user.posts.find(params[:id])
          erb :edit
    else 
      erb :posts

  end
end

get '/posts/:id/edit' do  #load edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end
 
patch '/posts/:id' do #edit action
  @post = Post.find_by_id(params[:id])
    @post.user_id  = current_user.id
    @post.name  = params[:name]
    @post.prepare  = params[:prepare]
    @post.region  = params[:region]
    @post.aroma  = params[:aroma]
    @post.flavour  = params[:flavour]
    @post.acidity  = params[:acidity]
    @post.body  = params[:body]
    @post.food  = params[:food]
    @post.notes  = params[:notes]
  @post.save
  redirect to "/posts/#{@post.id}"
end

  delete '/posts/:id/delete' do 
    #@current_user = User.find_by(:username => session[:username]) if session[:username]
    @post = Post.find_by_id(params[:id])
     if @post == current_user.posts.find(params[:id])
    @post.delete
    erb :delete
  end
end
  
  get '/posts/:id/delete' do
     #@current_user = User.find_by(:username => session[:username]) if session[:username]
     @post = Post.find_by_id(params[:id])
      if @post = current_user.posts.find(params[:id])
    @post.delete
    erb :delete
end
end
  

  
end