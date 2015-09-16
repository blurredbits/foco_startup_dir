class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.text :description
      t.text :location
      t.string :website

      t.timestamps null: false
    end
  end
end
