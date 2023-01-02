class Project < ApplicationRecord
  has_many :users_projects
  has_many :users, through: :users_projects
  validates :project_type, inclusion: { in: %w[school building bridge wells] }
end
