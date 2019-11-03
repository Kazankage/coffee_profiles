require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "coffeeprofiles"
  end

  get "/" do
    erb :welcome
  end

  get '/posts' do
      if !logged_in?
      erb :login
    else 
      erb :posts
    end
  end
  
  post '/posts' do
   erb :display
  end

  get '/edit' do
    if !logged_in?
       erb :login
    else
      post = Post.find(params[:user_id])
      if post.user_id == current_user.id
      "An edit post"
    end
  end
  end
  

  get '/sessions/posts'do
    if !logged_in?
      erb :login
    else
      erb :posts
    end
 end 
 
  get '/logout' do
    erb :welcome
  end
  
  helpers do
    def logged_in?
      !!@current_user
    end
    
    def login(username, password)
     user = User.find_by(:username => username)
       if user && user.authenticate(password)
         session[:username] = user.username
       else
         redirect '/login'
       end 
     end
     
     def logout!
       session.clear
     end
     
    def current_user
      @current_user ||  User.find_by(:username => session[:username]) if session[:username]
      #User.find(session[:username])
    end
  
 end 

end
