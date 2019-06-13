class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = I18n.t('controllers.projects.create.success')

      redirect_to(projects_path)
    else
      flash[:error] = I18n.t('controllers.projects.create.error')

      render(:new)
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = I18n.t('controllers.projects.update.success')

      redirect_to(@project)
    else
      flash[:error] = I18n.t('controllers.projects.update.error')

    render(:edit)
    end
  end

  def destroy
    if @project.destroy!
      flash[:success] = I18n.t('controllers.projects.destroy.success')

      redirect_to(projects_path)
    else
      flash[:error] = I18n.t('controllers.projects.destroy.error')

      redirect_to(@project)
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name,
      :owner
    )
  end
end
