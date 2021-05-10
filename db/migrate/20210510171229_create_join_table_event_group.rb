class CreateJoinTableEventGroup < ActiveRecord::Migration[6.1]
  def change
    create_join_table :projects, :groups do |t|
      t.index %i[project_id group_id]
      t.index %i[group_id project_id]
    end
  end
end
