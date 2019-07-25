module Projects
  class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    # GET /projects/1/tasks
    # GET /projects/1/tasks.json
    def index
      @tasks = project.tasks.all
    end

    # GET /projects/1/tasks/1
    # GET /projects/1/tasks/1.json
    def show
    end

    # GET /projects/1/tasks/new
    def new
      @task = project.tasks.new
      # binding.pry
    end

    # GET /projects/1/tasks/1/edit
    def edit
    end

    # POST /projects/1/tasks
    # POST /projects/1/tasks.json
    def create
      @task = project.tasks.new(task_params)

      if @task.save
        flash[:success] = I18n.t('controllers.projects.create.success')

        redirect_to(project_path(project))
      else
        flash[:error] = I18n.t('controllers.projects.create.error')

        render(:new)
      end
    end

    # PATCH/PUT /projects/1/tasks/1
    # PATCH/PUT /projects/1/tasks/1.json
    def update
      if @task.update(task_params)
        flash[:success] = I18n.t('controllers.projects.update.success')

        redirect_to(project_task_path(id: @task, project_id: project.id))
      else
        flash[:error] = I18n.t('controllers.projects.update.error')

        render(:edit)
      end
    end

    # DELETE /projects/1/tasks/1
    # DELETE /projects/1/tasks/1.json
    def destroy
      if @task.destroy!
        flash[:success] = I18n.t('controllers.projects.destroy.success')

        redirect_to(project_path(project))
      else
        flash[:error] = I18n.t('controllers.projects.destroy.error')

        redirect_to(project_task_path(id: @task, project_id: project.id))
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = project.tasks.find(params[:id])
    end

    def project
      @project ||= Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(
        :name,
        :goals_end_at,
        :goals_start_at,
        :obs,
        :full_detailing,
        :short_detailing,
        :user_id
      )
    end
  end
end
