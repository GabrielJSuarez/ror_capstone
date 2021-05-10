class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :user
      t.references :project

      t.timestamps
    end
  end
end
