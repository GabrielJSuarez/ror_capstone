class Group < ApplicationRecord
  belongs_to :user
  has_many :logs
  has_many :projects, through: :logs
  paginates_per 5
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end
