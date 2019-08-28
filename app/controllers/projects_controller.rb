class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.where(owner: current_user).or(Project.where(id: current_user.projects.pluck(:id)))
  end

  def show
  end

  def new
    @project = Project.new(owner: current_user)
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

  def schedule
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.json { render json: project_json }
      format.html {}
    end
  end

  def dashboard
    @project = Project.find(params[:project_id])
    @data = build_data_metrics
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name,
      :user_id,
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

  def build_data_metrics
    {
      tasks: {
        late: 26,
        in_progress: 5,
        done: 50,
        not_started: 23
      }
    }
  end
end
