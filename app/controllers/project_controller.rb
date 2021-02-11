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

    post '/projects' do
        if params.empty?
            # flash[:error] = "Every field must be filled out."
            redirect to '/projects/new'
        elsif logged_in? && !params.empty?
            @projects = current_user.projects.create(name: params[:name], location: params[:location], date_visited: params[:date_visited], rating: params[:rating])
            if @projects.save
                redirect to "/projects/#{@projects.id}"
            else
                # flash[:error] = "The trip was unable to be saved, try again."
                redirect to '/projects/new'
            end
        else
            # flash[:error] = "You need to be logged in to be able to see your trips."
            redirect to '/login'
        end
        current_user.save
    end

    get '/projects/:id' do
        if logged_in?
            @projects = Project.find_by_id(params[:id])
            erb :'/projects/show'
        else
            # flash[:error] = "You need to be logged in to see the trips."
            redirect to '/login'
        end
    end

    get '/projects/:id/edit' do
        @projects = Project.find_by_id(params[:id])
        if logged_in? && current_user.projects.include?(@projects)
            erb :'/projects/edit'
        else
            # flash[:error] = "You need to be logged in to see the trips."
            redirect to '/login'
        end
    end

    patch '/projects/:id' do
        @projects = Project.find_by_id(params[:id])
        if params.empty?
            # flash[:error] = "Every field must be filled out."
            redirect to "/projects/#{@projects.id}/edit"
        elsif logged_in? && !params.empty? && current_user.projects.include?(@projects)
            @projects.update(name: params[:name], location: params[:location], date_visited: params[:date_visited], rating: params[:rating])
            redirect to "/projects/#{@projects.id}"
        else
            # flash[:error] = "You need to be logged in."
            redirect '/login'
        end
    end

    delete '/projects/:id/delete' do
        if logged_in?
            @projects = Project.find_by_id(params[:id])
            if @projects.user == current_user then @projects.delete else redirect '/login' end
        else 
            # flash[:error] = "You must be logged in."
            redirect '/login'
        end
        redirect '/projects'
    end




end
