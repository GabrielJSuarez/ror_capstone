class Project < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :logs
  has_many :groups, through: :logs
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :time, presence: true, numericality: { only_integer: true }
end
