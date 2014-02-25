class HangoutEvent
  include Mongoid::Document

  embeds_many :hosts, :as => :hosts, :class_name => "User"
  embeds_many :attendees, :as => :attendees, :class_name => "User"
  embeds_many :pending_users, :as => :pending_users, :class_name => "User"
  has_many :messages

  field :name, type: String
  field :date, type: Date
  field :start_time, type: Time
  field :endtime, type: Time
end
