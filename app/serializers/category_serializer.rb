class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :job_categories
  has_many :jobs, through: :job_categories
end
