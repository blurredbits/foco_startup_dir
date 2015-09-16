class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.text :location
      t.integer :employees
      t.string :website

      t.timestamps null: false
    end
  end
end
