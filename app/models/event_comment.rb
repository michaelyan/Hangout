class EventComment
  include Mongoid::Document
  field :text, type: String
  field :timestamp, type: DateTime

  embedded_in :event
  belongs_to :user
end
