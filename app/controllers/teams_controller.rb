class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team
    else
      render json: @team.errors.full_messages,
      status: 422
    end
  end

  def index
    @teams = Team.all
    render json: @teams
  end

  def show
    @team = Team.find(params[:id])

    @member = Member.find_by_sql([
      'SELECT
        *
      FROM
        members
      WHERE
        team_id = ?', @team.id
    ])

    render json: @member
  end

  def update
      @team = Team.find(params[:id])

      if @team.update(team_params)
          render json: @team
      else
          render json: ["Team not found. Try different name!"], status:404
      end
  end

  def destroy
      @team = Team.find(params[:id])
      @team.destroy
      render json: ["Selected team is deleted!"]
  end

  private
  def team_params
    params.require(:teams).permit(:name)
  end

end
