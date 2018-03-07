class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: categories, status: 200
  end

  def create
    category = Category.create(category_params)
    render json: category, status: 201
  end

  def update
    @category.update(category_params)
    render json: @category, status: 200
  end

  def destroy
    categoryId = @category.id
    @category.destroy
    render json: {message:"Category has been deleted", categoryId:categoryId}
  end

  def show
    render json: @category, status: 200
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
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
        ]
    )
  end
end
