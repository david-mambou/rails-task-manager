class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :delete]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    # an empty instance is required to build the form
    @task = Task.new
    # view with form
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    # view with form
  end

  def update
    @task.update(task_params)
    redirect_to task_path(params[:id])
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
