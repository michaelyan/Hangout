class HangoutEvent
  include Mongoid::Document

  has_and_belongs_to_many :attendees, inverse_of: :attendee_of, class_name: "User"
  has_and_belongs_to_many :hosts, inverse_of: :host_of, class_name: "User"
  has_and_belongs_to_many :inviteees, inverse_of: :invitees_of, class_name: "User"
  has_many :messages
  has_many :events

  field :name, type: String
  field :date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time

  validates :name, :presence => { :message => "You must provide a name." }
  validates :date, :presence => { :message => "You must provide a date." }
end
