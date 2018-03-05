class User < ApplicationRecord
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :bookmarks
  has_many :notes

  has_secure_password
  validates :username, presence: true

  validates :password, presence: true

  has_secure_password



  validates :username, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { in: 6..20 }, allow_nil: true


  def saved_jobs
    self.jobs
  end

  def job_attributes=(job_attributes)
    job_attributes.values.each do |j|
      job = Job.find_or_create_by(j)
      self.jobs << job
    end
  end


  def user_companies
    final = []
    self.jobs.each do |job|
      if !final.any? {|c| c.museId==job.company_museId}
        final << job.company
      end
    end
    return final
  end





  # def add_jobs (title, date_published, contents, museId, location, level, company_id)
  #   job = Job.create(
  #     title: title,
  #     date_published: date_published,
  #     contents: contents,
  #     museId: museId,
  #     location: location,
  #     level: level,
  #     company_id: company_id
  #   )
  #   redirect_to json
  #
  #
  # end

end
