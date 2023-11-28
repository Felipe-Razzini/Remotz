class ProjectsController < ApplicationController

  def index
    @projects = Project.all

  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new

  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_path
      # redirect_to_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path, status: :see_other
  end

  private

  def project_params
    params.required(:project).permit(:name,:start_date,:end_date,:completed)
  end

end
