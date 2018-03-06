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
    companies = @user.user_companies
    bookmarks = @user.bookmarks
    user_info = {user: @user, jobs: jobs, companies: companies, bookmarks: bookmarks, notes: notes, bookmarks: bookmarks}
    render json: user_info, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user.create(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user
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

  def user_job
    @user = User.find(params[:id])
    @job = Job.find(params[:job_id])
    user_job = @user.jobs.find(@job.id)
    render json: user_job
  end

  def user_companies
    @user = User.find(params[:id])
    render json: @user.user_companies
  end

  def user_company
    @user = User.find(params[:id])
    @company = Company.find(params[:company_id])
    company_notes = @user.notes.find_by(company_id: @company.id)

    company_jobs = @user.jobs.select {|j| j.company_id == @company.id }


    company_bookmarks = @user.bookmarks.find_by(company_id: @company.id)
    company_info = {company: @company, company_notes: company_notes, company_jobs: company_jobs, company_bookmarks: company_bookmarks}
    render json: company_info
  end

  def add_jobs
    @user = User.find(params[:id])
    @company = Company.find_or_create_by(museId: params[:jobs][:company_museId])
    apiUrl = "https://api-v2.themuse.com/companies/" + @company.museId.to_s + "?api-key=82b2d1f745512b99a70044e6c6b316d86739a97719d5e88caf67a3f7fd788a00"
    companyApiCall = JSON.parse(RestClient.get(apiUrl))
    @company.update(
      name: companyApiCall["name"],
      size: companyApiCall["size"]["name"],
      location: companyApiCall["locations"][0]["name"],
      description: companyApiCall["description"],
      museId: companyApiCall["id"],
      twitter: companyApiCall["twitter"],
      image_link: companyApiCall["refs"]["f1_image"]
    )
    @job = Job.create(
      title: params[:jobs][:title],
      date_published: params[:jobs][:date_published],
      contents: params[:jobs][:contents],
      museId: params[:jobs][:museId],
      location: params[:jobs][:location],
      level: params[:jobs][:level],
      company_name: @company.name,
      company_museId: params[:jobs][:company_museId],
      date_saved: DateTime.now,
      applied_status: false,
      company_id: @company.id
    )
    @user.jobs << @job
    render json: @user.jobs
  end

  def update_job
    @user = User.find(params[:id])
    puts "@user"
    puts @user
    @job = @user.jobs.find(params[:job_id])
    puts "@job"

     @user.jobs.find(params[:job_id]).update(
      applied_status: params[:applied_status],
      date_applied: params[:date_applied],
      response_date: params[:response_date],
      followup_date: params[:followup_date],
      interview_invite: params[:interview_invite],
      interview_1_date: params[:interview_1_date],
      interview_1_type: params[:interview_1_type],
      interview_2_date: params[:interview_2_date],
      interview_2_type: params[:interview_2_type]
     )
    render json: {alert: "job saved!"}
  end

  def destroy_user_job
    @user = User.find(params[:id])
    @job = @user.jobs.find(params[:job_id])
    puts ("here i am... before destroy")
    puts @user.jobs
    puts @user.jobs.length
    @user.jobs.destroy(@job)
    puts "here i am after destroy"
    puts @user.jobs
    puts @user.jobs.length

    render json: {alert: "job deleted"}
  end

  def user_notes
    @user = User.find(params[:id])
    user_notes = @user.notes
    render json: user_notes
  end

  def add_notes

    @user = User.find(params[:id])
    byebug
    puts @user


    @note = Note.create(title: params[:notes][:title], content: params[:notes][:content], user_id: @user.id, company_id: params[:notes][:company_id], job_id: params[:notes][:job_id])
    byebug
    @user.notes << @note
    render json: @note
  end


  def notes_and_bookmarks
    @user = User.find[params[:id]]
    notes = @user.notes
    bookmarks = @user.bookmarks
    notes_and_bookmarks = {user: @user, notes: notes, bookmarks: bookmarks}
    render json: notes_and_bookmarks
  end



private

def user_params
  params.require(:user).permit(
    :username, :password, :password_confirmation,
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
      :job_id,
      :company_id
    ],
    bookmark_ids: [],
    bookmarks_attributes: [
      :title,
      :url,
      :event,
      :user_id,
      :company_id,
      :job_id
    ]
  )
end


end
