class TasksController < ApplicationController
  #Create
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end
  #Read
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  #Update
  def edit
    @task = Task.find(params[:id])
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save
    redirect_to task_path(@task)
  end
  #Delete
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @task.save
    redirect_to tasks_path
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
