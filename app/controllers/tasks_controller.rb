class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    done = current_user.tasks_done + 1
    current_user.update_attribute(:tasks_done, done)
  end

  private
  def task_params
    params.require(:task).permit(:name)
  end

end
