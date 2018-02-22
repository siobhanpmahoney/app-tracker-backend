class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :size, :location, :description, :museId, :twitter, :image_link
  has_many :jobs
  has_many :bookmarks
  has_many :notes
  has_many :company_industries
  has_many :industries, through: :company_industries
end
