class UserController < ApplicationController
    enable :sessions

    get '/signup' do
        !logged_in? ? (erb :'/users/signup') : (redirect to '/')
    end

    get '/users/:slug' do
        @users = User.find_by_slug(params[:slug])
        erb :'users/account'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            # flash[:error] = "One or more fields were left blank. Please try again."
            redirect to "/signup"
        else 
            @users = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @users.save
            session[:user_id] = @users.id
            redirect to "/projects"
        end
    end



    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && @user.authenticate(params[:password])
            session[:user_id] = user.id
            redirecto to "/projects"
        else 
            # flash[:error] = "Wrong"
            redirect to "/login"
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end
    
end
