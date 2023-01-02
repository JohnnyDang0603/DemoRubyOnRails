class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :shool_name
      t.integer :amount_student
      t.belongs_to :project

      t.timestamps
    end
  end
end
