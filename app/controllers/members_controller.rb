class MembersController < ApplicationController

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member
    else
      render json: @member.errors.full_messages,
      status: 422
    end
  end

  def index
    if params.has_key?(:team_id)
      @members = Member.where(team_id: params[:team_id])
    elsif params.has_key?(:project_id)
      @members = Member.where(project_id: params[:project_id])
    else
      @members = Member.all
    end

    render :index

  end

  def show
    @member = Member.find_by(id: params[:id])

    unless @member
      redirect_to members_url
      return
    end

    render :show
  end

  def update
      @member = Member.find(params[:id])

      if @member.update(member_params)
          render json: @member
      else
            render json: @member.errors.full_messages, status: 422
      end
  end

  def destroy
      @member = Member.find(params[:id])

      unless @members
        redirect_to members_url
      end

      @member.destroy

  end

  private
  def member_params
    params.require(:members).permit(:first_name, :last_name, :city, :state, :country, :team_id,:team_name, :project_id, :project_name)
  end

end
