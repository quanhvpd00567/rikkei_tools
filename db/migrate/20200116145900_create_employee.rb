class CreateEmployee < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :code
      t.string :name
      t.integer :role
      t.integer :level
      t.timestamps
    end
  end
end
