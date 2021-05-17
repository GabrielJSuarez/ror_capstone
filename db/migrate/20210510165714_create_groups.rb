# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
