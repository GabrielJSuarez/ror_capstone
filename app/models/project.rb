class Project < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :logs
  has_many :groups, through: :logs
end
