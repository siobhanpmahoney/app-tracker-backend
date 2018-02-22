class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :event, :user_id, :company_id, :job_id
  belongs_to :user
  belongs_to :company
  belongs_to :job
end
