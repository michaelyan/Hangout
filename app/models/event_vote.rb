class EventVote
  include Mongoid::Document
  field :up, type: Boolean

  embedded_in :event
  belongs_to :user
end