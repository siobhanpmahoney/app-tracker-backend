class Api::V1::JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    company = @job.company
    render json: @job
  end

  def index
    @jobs = Job.all
    render json: @jobs
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
      :company_museId,
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
      :company_id,
      company: [
        :name,
        :size,
        :location,
        :description,
        :museId,
        :twitter,
        :image_link
      ],
      category_ids: [],
      categories_ids: [
        :name
      ]
  end


end
