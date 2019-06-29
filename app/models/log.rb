class Log < ApplicationRecord
  belongs_to :user
  belongs_to :attendee , class_name: 'User'
end
