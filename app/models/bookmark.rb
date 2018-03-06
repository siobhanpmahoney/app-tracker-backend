class Bookmark < ApplicationRecord
  belongs_to :user
  has_one :company
  has_one :job
end
