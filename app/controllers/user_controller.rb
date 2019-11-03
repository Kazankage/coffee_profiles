class UserController < ApplicationController
  
   get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if @user.save
      erb :posts
    else
      erb :signup
    end
  end
  
  get '/login' do
    erb :login
  end
  
  post '/login' do 
     login(params[:username], params[:password])
     redirect '/login/posts'
   end
  


end