class CreateWork < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.integer :employee_id
      t.integer :project_id
      t.integer :year
      t.integer :month
      t.text :note
      t.timestamps
    end
  end
end
