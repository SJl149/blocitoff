class TasksController < ApplicationController
  respond_to :html, :js

  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      flash.now[:alert] = "Error creating task. Please try again."
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

#    if @task.destroy
#      flash[:notice] = "Task is accomplished!"
#      respond_to do |format|
#        format.html { redirect_to tasks_path }
#        format.json { head :no_content }
#        format.js   { render :layout => false }
#      end
#    else
#      flash.now[:alert] = "There was a problem checking off your task."
#      redirect_to tasks_path
#    end
  end

  private
  def task_params
    params.require(:task).permit(:name)
  end

end
