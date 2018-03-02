class Job < ApplicationRecord
  belongs_to :company
  has_many :user_jobs
  has_many :users, through: :user_jobs
  has_many :notes
  has_many :bookmarks
  has_many :job_categories
  has_many :categories, through: :job_categories



  def save_company
    company = self.company
    Company.find_or_create_by(company[:museId])
    company.jobs << self
  end

  def company_attributes=(company_attributes)
    company_attributes.values.each do |c|
      co = Company.find_or_create_by(c)
      self.company = co
    end
  end

  def category_attributes=(category_attributes)
    category_attributes.values.each do |c|
      category = Category.find_or_create_by(c)
      self.categories << category
    end
  end

  def note_attributes=(note_attributes)
    note_attributes.values.each do |n|
      note = Note.find_or_create_by |n|
      self.notes << note
    end
  end 


end
