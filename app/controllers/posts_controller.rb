class PostsController < ApplicationController
  
    get '/posts/new' do
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
    end
  end
  
    get '/posts/:id' do
      @post = Post.find_by(id: params[:id])
    erb :show

  end
 
 get '/edit' do
  erb :edit
end 
  
  get '/posts/:id/edit' do

     @post = Post.find_by(id: params[:id])
      if post = current_user.post.find(params[:id])
     erb :edit
    else 
      :posts

  end
end

  delete '/posts/:id/delete' do 
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect '/posts/delete'
  end
  
  get '/posts/delete' do
  erb :delete
end
  
=begin    get '/posts/:id/edit' do
# if !logged_in?
 #     erb :display
  #  else
      
      if post = current_user.post.find_by(params[:id])
      erb :edit_posts
    else
      redirect '/posts'
      end
#  end
=end end
 
  
end