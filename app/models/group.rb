class Group < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_and_belongs_to_many :events
end
