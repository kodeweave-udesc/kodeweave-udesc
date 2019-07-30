class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects + Project.where(owner: current_user)
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
    @project.owner = User.find(params.require(:project)[:owner])

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

  def schedule
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.json { render json: project_json }
      format.html {}
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name,
      user_ids: []
    )
  end

  def project_json
    @project.tasks.map do |task|
      {
        id: task.id,
        title: task.name,
        description: task.short_detailing,
        start: task.goals_start_at,
        end: task.goals_end_at + 1.day,
        url: project_task_path(id: task, project_id: task.project.id, format: :html),
        update_url: project_task_path(id: task, project_id: task.project.id),
        color: task.color,
        user_name: task.user
      }
    end
  end
end
