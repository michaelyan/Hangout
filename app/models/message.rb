class Message
  include Mongoid::Document

  belongs_to :hangout_event
  belongs_to :user

  field :text, type: String
  field :timestamp, type: DateTime
end
