class Api::V1::JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    company = @job.company
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.find_by(museId: params[:museId])
    if @job
      @job.update(job_params)
    else
      @job.create(job_params)
    end
    redirect_to @job
  end

  private

  def job_params
    params.require(:job).permit(
      :title,
      :date_published,
      :contents,
      :museId,
      :location,
      :level,
      :date_saved,
      :applied_status,
      :date_applied,
      :response_date,
      :followup_date,
      :interview_invite,
      :interview_1_date,
      :interview_1_type,
      :interview_2_date,
      :interview_2_type,
      :company_id)
  end


end
