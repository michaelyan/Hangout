class User
  include Mongoid::Document

  has_many :messages
  embedded_in :hosts, polymorphic: true
  embedded_in :attendees, polymorphic: true
  embedded_in :pending_users, polymorphic: true

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :fb_id, type: Integer
  field :username, type: String
  field :password, type: String

  validates :email, format: { with: /.+@.+\..+/i }
  validates :password, length: {minimum: 6}
end
