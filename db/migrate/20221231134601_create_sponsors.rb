class CreateSponsors < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsors do |t|
      t.string :project_name
      t.string :project_type
      t.string :description
      t.string :status
      t.float :amount_money
      t.belongs_to :user

      t.timestamps
    end
  end
end
