class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :contactee , class_name: 'User'
end
