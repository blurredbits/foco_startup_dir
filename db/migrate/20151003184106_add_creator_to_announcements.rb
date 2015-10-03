class AddCreatorToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :announcements, :creator, index: true
    add_foreign_key :announcements, :users, column: :creator_id
  end
end
