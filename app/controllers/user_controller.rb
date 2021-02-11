class UserController < ApplicationController
    enable :sessions

    get '/users/:slug' do
        @users = User.find_by_slug(params[:slug])
        erb :'users/account'
    end


    get '/signup' do
      if !logged_in?
      erb :'users/signup'
    else
      redirect '/index'
        end
    end

  
    post '/signup' do
          user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        if user.save 
            session[:user_id] = user.id
            redirect "/projects"
        else
            # flash[:error] = "Something went wrong. Please try again!"
            redirect to "/signup"
        end
    end



    get '/login' do
       user = User.find_by(:username => params[:username])
       !logged_in? ? (erb :'/users/login') : (redirect "/projects")
    end

    
    get '/logout' do
        if logged_in?
            session.destroy
            redirect '/login'
        else
            redirect '/'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/projects"
        else
            # flash[:error] = "Incorrect username or password. Please try again!"
            redirect "/login"
        end
    end


    
end
