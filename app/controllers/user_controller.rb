class UserController < ApplicationController
    
    enable :sessions

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && @user.authenticate(params[:password])
            session[:user_id] = user.id
            redirecto to "/projects"
        else 
            flash[:error] = "Wrong"
            redirect to "/login"
        end
    end

end
