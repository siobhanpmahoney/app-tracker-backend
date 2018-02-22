class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :event
end
