class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  has_many :contacts
  has_many :contactees, through: :contacts
  has_many :inverse_contacts, class_name: 'Contact', foreign_key: 'contactee_id'
  has_many :inverse_contactees, through: :inverse_contacts , source: :user

end
