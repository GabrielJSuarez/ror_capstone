# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.references :group, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
