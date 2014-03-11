class HangoutEvent
  include Mongoid::Document

  embeds_many :hosts, :as => :hosts, :class_name => "User"
  embeds_many :attendees, :as => :attendees, :class_name => "User"
  embeds_many :pending_users, :as => :pending_users, :class_name => "User"
  has_many :messages

  field :name, type: String
  field :date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time

  validates :name, :date, :presence => { :message => "You must provide a name and date." }
  validates :start_time, :numericality => { :less_than_or_equal_to => :end_time }
  validates :end_time, :numericality => { :greater_than_or_equal_to => :start_time }
end
