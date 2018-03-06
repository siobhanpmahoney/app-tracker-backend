class BookmarkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :event, :user_id, :company_id, :job_id
  belongs_to :user
  has_one :company
  has_one :job
end
