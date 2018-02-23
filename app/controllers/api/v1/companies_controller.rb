class Api::V1::CompaniesController < ApplicationControlle

  def index
    @companies = Company.all
    render json: @companies
  end


  def show
    @company = Company.find_by(museId: params[:museId])
    render json: @company
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
    params.require(:company).permit(:name, :size, :location, :description, :museId, :twitter, :image_link)
  end
end
