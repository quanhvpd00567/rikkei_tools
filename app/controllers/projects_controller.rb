class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new({name: params['project']['name']})
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params['id'])
    if @project.nil?
      redirect_to projects_path
    end
  end

  def update
    @project = Project.find(params['id'])
    if @project.nil?
      redirect_to projects_path
    end
    @project.update({name: params['project']['name']})
    if @project.save
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def show

  end

end
