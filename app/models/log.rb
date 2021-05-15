# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :group
  belongs_to :project
  validates :project_id, presence: true
end
