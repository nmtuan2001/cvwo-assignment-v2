class ProjectController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /project
  def index
    @project = Project.all
    json_response(@project)
  end

  # POST /project
  def create
    @project = Project.create!(project_params)
    json_response(@project, :created)
  end

  # GET /project/:id
  def show
    json_response(@project)
  end

  # PUT /project/:id
  def update
    @project.update(project_params)
    head :no_content
  end

  # DELETE /project/:id
  def destroy
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.permit(:title, :note)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
