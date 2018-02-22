class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :size, :location, :description, :museId, :twitter, :image_link
end
