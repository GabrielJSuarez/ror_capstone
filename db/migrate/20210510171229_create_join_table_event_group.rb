class CreateJoinTableEventGroup < ActiveRecord::Migration[6.1]
  def change
    create_join_table :events, :groups do |t|
      t.index %i[event_id group_id]
      t.index %i[group_id event_id]
    end
  end
end
