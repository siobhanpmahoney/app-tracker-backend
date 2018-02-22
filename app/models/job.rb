class Job < ApplicationRecord
  belongs_to :company
  has_many :user_jobs
  has_many :users, through: :user_jobs
  has_many :notes
  has_many :bookmarks
  has_many :job_categories
  has_many :categories, through: :job_categories


end
