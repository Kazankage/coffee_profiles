class UserController < ApplicationController
  
   get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new(params)
    if @user.save  
      session[:username] = @user.username
      redirect '/home'
    else 
      erb :signup
    end
  end
  
  get '/login' do
    erb :login
  end
  
  post '/login' do 
     login(params[:username], params[:password])
    erb :home
   end
  
  get '/logout' do
    logout!
    erb :welcome
  end

end