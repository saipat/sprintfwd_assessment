class Team < ApplicationRecord
    validates :name, presence: true

    has_many :members,
      primary_key: :id,
      foreign_key: :member_id,
      class_name: :Member
end
