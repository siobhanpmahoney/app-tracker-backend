class IndustrySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :company_industries
  has_many :companies, through: :company_industries
end
