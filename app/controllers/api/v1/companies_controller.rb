class Api::V1::CompaniesController < ApplicationController
  def show
    @company = Company.find_by(museId: params[:museId])
  end

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.find_or_create_by(museId: params[:museId])
    if @company
      @company.update(company_params)
    else
      @company.create(company_params)
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :size, :location, :description, :museId, :twitter, :image_link)
  end
end
