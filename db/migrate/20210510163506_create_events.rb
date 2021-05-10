class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :author
      t.string :name
      t.integer :time

      t.timestamps
    end
  end
end
