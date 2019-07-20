class Admin::ProjectsController < Admin::ForestController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = apply_scopes(Project).by_id.page(params[:page])
  end

  def show
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project

    if @project.save
      redirect_to edit_admin_project_path(@project), notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @project

    if @project.update(project_params)
      redirect_to edit_admin_project_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to admin_projects_url, notice: 'Project was successfully destroyed.'
  end

  private

    def project_params
      # Add blockable params to the permitted attributes if this record is blockable `**BlockSlot.blockable_params`
      params.require(:project).permit(:slug, :status, :title, :subtitle, :description, :metadata, :media_item_id, :page_color, :url, **BlockSlot.blockable_params)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
