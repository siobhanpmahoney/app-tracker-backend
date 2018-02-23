class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  # , :password_digest
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :bookmarks
  has_many :notes
end
