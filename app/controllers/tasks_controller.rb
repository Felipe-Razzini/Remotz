class TasksController < ApplicationController

  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all

    start_date = params.fetch(:start_date, Date.today).to_date

    @tasks_cal = Task.where(start: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

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

    redirect_to dashboard_path
  end

  def destroy
    @task.destroy

    redirect_to request.referrer, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.required(:task).permit(:title, :priority, :start, :end, :status)
  end

end
