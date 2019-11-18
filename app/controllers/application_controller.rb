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
     User.find_by(:username => session[:username]) if session[:username]
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
