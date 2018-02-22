class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    user_jobs = @user.jobs
    user_bookmarks = @user.bookmarks
    user_notes = @user.notes
    user_profile = {user: @user, jobs: user_jobs, notes: user_notes, bookmarks: user_bookmarks}
    render json: user_profile
  end


  def create
    @user=User.find_or_create_by(username: params[:username])
    user_jobs = @user.jobs
    user_bookmarks = @user.bookmarks
    user_notes = @user.notes
    user_companies = user_jobs.map {|j| j.company}
    user_profile = {user: @user, jobs: user_jobs, companies: user_companies, notes: user_notes, bookmarks: user_bookmarks}
    render json: user_profile
  end







end
