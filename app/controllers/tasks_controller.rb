class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Task was saved successfully."
      redirect_to tasks_path
    else
      flash.now[:alert] = "Error creating task. Please try again."
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :user_id)
  end

end
