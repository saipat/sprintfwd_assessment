class Member < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true

    belongs_to :team,
      primary_key: :id,
      foreign_key: :team_id,
      class_name: :Team

    belongs_to :project,
      primary_key: :id,
      foreign_key: :project_id,
      class_name: :Project

    has_many :projects,
      primary_key: :id,
      foreign_key: :project_id,
      class_name: :Project
end
