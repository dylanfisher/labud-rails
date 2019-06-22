class ProjectsController < ForestController
  before_action :set_project, only: [:show]

  def index
    # TODO: published/statusable scope
    @projects = apply_scopes(Project)
  end

  def show
    authorize @project
    @body_styles ||= []

    if @project.page_color.present?
      @body_styles << "background-color: #{@project.page_color};"
    end
  end

  private

    def set_project
      @project = Project.find_by!(slug: params[:id])
    end
end
