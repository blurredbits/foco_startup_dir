class Announcement < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :creator, class_name: "User"
end
