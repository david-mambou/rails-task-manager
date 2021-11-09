class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = select_task
  end

  def new
    # an empty instance is required to build the form
    @task = Task.new
    # view with form
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path # or render? Redirect for an url, render for a view file
  end

  def edit
    @task = select_task
    # view with form
  end

  def update
    select_task.update(task_params)
    redirect_to task_path(params[:id])
  end

  def destroy
    select_task.destroy
    redirect_to tasks_path
  end

  private

  def select_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
