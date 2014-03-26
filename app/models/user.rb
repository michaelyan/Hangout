class User
  include Mongoid::Document

  has_many :messages
  has_many :event_votes
  has_and_belongs_to_many :host_of, inverse_of: :hosts, class_name: "HangoutEvent"
  has_and_belongs_to_many :attendee_of, inverse_of: :attendees, class_name: "HangoutEvent"
  has_and_belongs_to_many :invitee_of, inverse_of: :invitees, class_name: "HangoutEvent"

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :fb_id, type: Integer
  field :username, type: String
  field :password, type: String

  validates :email, format: { with: /.+@.+\..+/i }
  validates :password, length: {minimum: 6}

  def full_name
    return self.first_name + " " + self.last_name
  end
end
