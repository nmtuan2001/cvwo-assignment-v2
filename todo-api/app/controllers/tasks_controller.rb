class TasksController < ApplicationController
  before_action :set_project
  before_action :set_project_task, only: [:show, :update, :destroy]

  # GET /projects/:project_id/tasks
  def index
    json_response(@project.tasks)
  end

  # GET /projects/:project_id/tasks/:id
  def show
    json_response(@task)
  end

  # POST /projects/:project_id/tasks
  def create
    @project.tasks.create!(task_params)
    json_response(@project, :created)
  end

  # PUT /projects/:project_id/tasks/:id
  def update
    @task.update(task_params)
    head :no_content
  end

  # DELETE /projects/:project_id/tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.permit(:task_name, :task_note, :completed, :deadline)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_project_task
    @task = @project.tasks.find_by!(id: params[:id]) if @project
  end
end
