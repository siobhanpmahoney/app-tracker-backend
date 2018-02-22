class Api::V1::BookmarksController < ApplicationController

  def index
    bookmarks = Bookmark.all
    render json: bookmarks, status: 200
  end

  def create
    bookmark = Bookmark.create(bookmark_params)
    render json: bookmark, status: 201
  end

  def update
    @bookmark.update(bookmark_params)
    render json: @bookmark, status: 200
  end

  def destroy
    bookmarkId = @bookmark.id
    @bookmark.destroy
    render json: {message:"Zap! Bookmark deleted", bookmarkId:bookmarkId}
  end

  def show
    render json: @bookmark, status: 200
  end

  private
  def bookmark_params
    params.permit(:title, :url, :event, :user_id, :company_id, :job_id)
  end

end
