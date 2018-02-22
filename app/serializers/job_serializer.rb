class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :date_published, :contents, :museId, :location, :level, :date_saved, :applied_status, :date_applied, :response_date, :followup_date, :interview_invite, :interview_1_date, :interview_1_type, :interview_2_date, :interview_2_type, :company_id
  belongs_to :company
  has_many :user_jobs
  has_many :users, through: :user_jobs
  has_many :notes
  has_many :bookmarks
  has_many :job_categories
  has_many :categories, through: :job_categories
end
