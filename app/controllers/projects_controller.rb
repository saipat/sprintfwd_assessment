class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project
    else
      render json: @project.errors.full_messages,
      status: 422
    end
  end

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    @project = Project .find(params[:id])

    @members = Member.find_by_sql([
      'SELECT
        *
      FROM
        members
      WHERE
        project_id = ?', @project.id
    ])

    render json: @members
  end

  def update
      @project = Project.find(params[:id])

      if @project.update(project)
          render json: @project
      else
          render json: ["Project not found. Try different name!"], status:404
      end
  end

  def destroy
      @project = Project.find(params[:id])
      @project.destroy
      render json: ["Selected project is deleted!"]
  end

  private
  def project_params
    params.require(:projects).permit(:name)
  end

end
