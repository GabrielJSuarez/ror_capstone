class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_and_belongs_to_many :groups
end
