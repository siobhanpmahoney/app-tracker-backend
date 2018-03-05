class Company < ApplicationRecord
  has_many :jobs
  has_many :bookmarks
  has_many :notes
  has_many :company_industries
  has_many :industries, through: :company_industries

  def job_attributes=(job_attributes)
    job_attributes.values.each do |j|
      job = Job.find_or_create_by(j)
      self.jobs << job
    end
  end
  
end
