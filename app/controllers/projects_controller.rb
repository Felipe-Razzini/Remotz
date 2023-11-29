class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all

  end

  def show

  end

  def new
    @project = Project.new

  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_path

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

    @project.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy

    @project.destroy

    redirect_to projects_path, status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.required(:project).permit(:name,:start_date,:end_date,:completed)
  end

end
