class ProjectController < ApplicationController 

    get '/projects' do
        if logged_in?
            @projects = Project.all
            erb :'/projects/index'
        else
            redirect '/login'
        end
    end

end
