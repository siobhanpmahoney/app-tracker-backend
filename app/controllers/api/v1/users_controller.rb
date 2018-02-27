class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    jobs = @user.jobs
    bookmarks = @user.bookmarks
    notes = @user.notes
    user_info = {user: @user, jobs: jobs, bookmarks: bookmarks, notes: notes}
    render json: user_info, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {message: "Error, new user not saved"}
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    render json: @user
  end

  def user_jobs
    @user = User.find(params[:id])
    user_jobs = @user.jobs
    render json: user_jobs
  end

  def add_jobs
    @user = User.find(params[:id])

    # @company

    @job = Job.create(
      title: params[:jobs][:title],
      date_published: params[:jobs][:date_published],
      contents: params[:jobs][:contents],
      museId: params[:jobs][:museId],
      location: params[:jobs][:location],
      level: params[:jobs][:level],
      date_saved: DateTime.now,
      applied_status: false,
      company_id: params[:jobs][:company_id])
    @user.jobs << @job

    
    render json: @user.jobs

  end



private

def user_params
  params.require(:user).permit(
    :username,
    job_ids: [],
    jobs_attributes: [
      :title, :date_published, :contents, :museId, :location, :level, :date_saved, :applied_status, :date_applied, :response_date, :followup_date, :interview_invite, :interview_1_date, :interview_1_type, :interview_2_date, :interview_2_type, :company_id]
    # , :password, :password_confirmation)
  )
end






end
