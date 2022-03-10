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
    @members = Member.all
    render json: @members
  end

  def show
    @member = Member.find(params[:id])
    render json: @member
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
      @member.destroy
      render json: ["Selected member is deleted!"]
  end

  private
  def member_params
    params.require(:members).permit(:first_name, :last_name, :city, :state, :country, :team_id, :project_id)
  end

end
