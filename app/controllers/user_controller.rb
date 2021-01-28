class UserController < ApplicationController
    enable :sessions

    get '/login' do
        erb :'users/login'
    end


end
