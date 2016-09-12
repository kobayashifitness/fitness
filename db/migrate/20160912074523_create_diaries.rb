class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.float :weight
      t.integer :num
      t.integer :set
      t.string :note

      t.timestamps
    end
  end
end
