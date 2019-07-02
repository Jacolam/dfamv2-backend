class UserSerializer < ActiveModel::Serializer
  attributes :username, :phone, :email, :avatar, :twitter, :facebook

  has_many :logs
  has_many :inverse_logs

  has_many :contacts do
    object.contacts.map do |contact|
      contact = {
        contactee: {
          id: contact.contactee_id,
          username: contact.contactee.username,
          phone: contact.contactee.phone,
          email: contact.contactee.email,
          avatar: contact.contactee.avatar,
          twitter: contact.contactee.twitter,
          facebook: contact.contactee.facebook
        },
        meet_cycle: contact.meet_cycle,
        call_cycle: contact.call_cycle

      }
    end
  end
end
