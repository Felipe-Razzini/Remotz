class TasksController < ApplicationController

  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all

  end

  def show

  end

  def new
    @task = Task.new

  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to tasks_path

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy

    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.required(:task).permit(:title, :priority, :start, :end, :completed)
  end

end
