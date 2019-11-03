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

  get '/login/posts' do
      redirect '/posts'
  end
  
  get '/posts' do
    erb :posts
  end
  
  post '/posts' do
    redirect '/display'
  end
  
  get '/display' do
    erb :display
  end
  
   get '/display/edit' do
     erb :edit
    #redirect '/posts/:id/edit'
  end
  

  get '/edit' do
    erb :error
  end
  
  post '/edit' do
    erb :edit
  end
  
  get '/edit/error' do
    erb :error
  end
  
  get '/posts/:user_id/edit' do
# if !logged_in?
 #     erb :display
  #  else
      
      if post = current_user.post.find_by(params[:id])
      erb :edit_posts
    else
      redirect '/posts'
      end
#  end
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
 
 def clear_info
    User.create(username: "username")
  username= User.find_by(username: "Username")
  username.delete
 end
 
 def clear_info
    User.delete_all
 end

 
 def fix_it_up
  User.create(username: "old_username")
  username = User.find_by(username: "old_username")
  username.update(username: "new")

 end

end
