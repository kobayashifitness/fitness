class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.integer :age
      t.string :datetime
      t.float :fat
      t.string :goal
      t.float :height
      t.float :muscle
      t.string :name
      t.string :sex
      t.float :weight

      t.timestamps
    end
  end
end
