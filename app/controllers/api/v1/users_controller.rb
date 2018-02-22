class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    user_jobs = @user.jobs
    user_bookmarks = @user.bookmarks
    user_notes = @user.notes
    user_profile = {user: @user, jobs: user_jobs, notes: user_notes, bookmarks: user_bookmarks}
    render json: user_profile, status: 200
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



private

def user_params
  params.requre(:user).permit(:username, :password, :password_confirmation)
end






end
