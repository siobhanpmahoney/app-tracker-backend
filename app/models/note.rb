class Note < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :job
end
