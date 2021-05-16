class Project < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :logs
  has_many :groups, through: :logs
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }
  validates :time, presence: true, numericality: { only_integer: true }
  paginates_per 5
end
