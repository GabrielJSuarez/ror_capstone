# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :author
      t.string :name
      t.integer :time

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
