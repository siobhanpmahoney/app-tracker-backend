class User < ApplicationRecord
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :bookmarks
  has_many :notes

  has_secure_password
  validates :username, presence: true

  validates :password, presence: true

  def saved_jobs
    self.jobs
  end

end
