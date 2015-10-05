class AddCreatorToOffices < ActiveRecord::Migration
  def change
    add_reference :offices, :creator, index: true
    add_foreign_key :offices, :users, column: :creator_id
  end
end
