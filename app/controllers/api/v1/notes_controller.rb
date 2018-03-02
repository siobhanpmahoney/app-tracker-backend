class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show,:update,:destroy]

  def index
    @notes = Note.all
    render json: @notes, status: 200
  end

  def create
    @note = Note.create(note_params)
    note_company = Company.find(params[:company_id])
    note_job = Job.find(params[:job_id])
    note_user = User.find(params[:user_id])
    note_info = {note: @note, company: note_company, job: note_job, user: note_user}
    render json: note_info
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    render json: @note, status: 200
  end

  def destroy
    noteId = @note.id
    @note.destroy
    render json: {message:"Note has been deleted", noteId:noteId}
  end

  def show
    @note = Note.find(params[:id])
    note_company = Company.find(params[:company_id])
    note_job = Job.find(params[:job_id])
    note_user = User.find(params[:user_id])
    note_info = {note: @note, company: note_company, job: note_job, user: note_user}
    render json: note_info, status: 200
  end

  private
  def note_params
    params.permit(:title, :content, :event, :user_id, :company_id, :job_id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
