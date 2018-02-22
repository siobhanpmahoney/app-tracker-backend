class BookmarkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :event
end
