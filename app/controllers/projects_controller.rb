class ProjectsController < ApplicationController
  include SharedConcepts

  before_action :set_project_statuses, only: [:new, :edit]

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.includes(PROJECT_PRELOAD_FEILDS).find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project is recorded."
      redirect_to new_project_path
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project is updated."
      redirect_to projects_path
    else
      render :edit
    end
  end

  def admin_action
    @project = Project.find(params[:project_id])
    if @project.update_attributes(project_status_id: params[:status])
      flash[:success] = "Project is updated successfully."
    end
    redirect_to projects_path
  end

  private

  def set_project_statuses
    @project_statuses ||= Rails.cache.fetch("project_statuses", :expires_in => 1.day) do
      ProjectStatus.includes(:translations).all
    end
  end

  def project_params
    params.require(:project).permit(:name, :comment, :project_status_id)
  end
end
