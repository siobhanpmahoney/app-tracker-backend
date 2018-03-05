class Api::V1::CompaniesController < ApplicationControlle

  def index
    @companies = Company.all

    render json: @companies
  end


  def show
    @company = Company.find(params[:id])
    company_jobs = @company.jobs
    company_bookmarks = @company.bookmarks
    company_notes = @company.notes
    company_info = {company: @company, company_jobs: company_jobs, company_notes: company_notes}
    render json: company_info
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.find_by(museId: params[:museId])
    if @company
      @company.update(company_params)
    else
      @company.create(company_params)
    end
    redirect_to @company
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :size,
      :location,
      :description,
      :museId,
      :twitter,
      :image_link,
      job_ids: [],
      jobs_attributes: [
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
        :company_id
      ],
      note_ids: [],
      notes_attributes: [
        :title,
        :content,
        :event,
        :user_id,
        :company_id,
        :job_id
      ]
    )
  end
end
