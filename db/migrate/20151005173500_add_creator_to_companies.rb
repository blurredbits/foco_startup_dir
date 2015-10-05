class AddCreatorToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :creator, index: true
    add_foreign_key :companies, :users, column: :creator_id
  end
end
