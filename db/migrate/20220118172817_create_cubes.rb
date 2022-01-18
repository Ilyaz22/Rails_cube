class CreateCubes < ActiveRecord::Migration[6.1]
  def change
    create_table :cubes do |t|
      t.float :size
      t.string :color
      t.float :weight
      t.string :material
      t.timestamps
    end
  end
end
