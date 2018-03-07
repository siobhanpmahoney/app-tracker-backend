class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :size, :location, :description, :museId, :twitter, :image_link
  has_many :jobs
  has_many :bookmarks
  has_many :notes
  belongs_to :industry
end
