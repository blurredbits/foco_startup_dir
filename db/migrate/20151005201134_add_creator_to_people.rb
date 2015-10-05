class AddCreatorToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :creator, index: true
    add_foreign_key :people, :users, column: :creator_id
  end
end
