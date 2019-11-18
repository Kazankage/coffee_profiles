class UserController < ApplicationController
  
   get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.save
    @current_user = User.find_by(:username => session[:username]) if session[:username]
    current_user = @user
   
      erb :posts
   # else
    #  erb :signup
   # end
  end
  
  get '/login' do
    erb :login
  end
  
  post '/login' do 
     login(params[:username], params[:password])
    erb :posts
   end
  
  get '/logout' do
    logout!
    erb :welcome
  end

end