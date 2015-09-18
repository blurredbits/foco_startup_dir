class Announcement < ActiveRecord::Base
  validates :title, presence: true
end
