class AddEventToDiaries < ActiveRecord::Migration
  def change
    add_column :diaries, :event, :string
  end
end
