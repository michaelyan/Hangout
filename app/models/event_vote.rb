class EventVote
  include Mongoid::Document
  field :vote, type: Boolean

  embedded_in :event
  belongs_to :user
end
