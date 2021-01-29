class ProjectController < ApplicationController 

    get '/projects' do
        if logged_in?
            @projects = Project.all
            erb :'/projects/index'
        else
            redirect '/login'
        end
    end

    get '/projects/new' do
        if logged_in?
            erb :'/projects/create_projects'
        else 
            redirect to '/login'
        end
    end

end
