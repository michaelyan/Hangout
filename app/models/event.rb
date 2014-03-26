class Event
  include Mongoid::Document
  field :name, type: String
  field :details, type: String
  field :location, type: String
  field :start_time, type: Time
  field :end_time, type: Time

  belongs_to :hangout_event
  embeds_many :event_votes

  def upvote_or_downvote(upvote_or_downvote, user_id)
    for vote in self.event_votes
      if vote.user_id == user_id 
        if upvote_or_downvote == vote.vote #user voted the same way
          vote.destroy
          return
        elsif upvote_or_downvote != vote.vote #user changed their vote
          vote.destroy
          self.event_votes.create(vote: upvote_or_downvote, user_id: user_id)
          return
        end
      end
    end
    #otherwise it is a new vote
    self.event_votes.create(vote: upvote_or_downvote, user_id: user_id)
  end

  def num_upvotes
    return self.num_upvotes_or_downvotes(true)
  end

  def num_downvotes
    return self.num_upvotes_or_downvotes(false)
  end

  #validate upvote and downvotes one per user
  def num_upvotes_or_downvotes(upvote_or_downvote)
    num_upvotes = 0
    for vote in self.event_votes
      if vote.vote == true
        num_upvotes += 1
      end
    end

    if (upvote_or_downvote)
      return num_upvotes
    else
      return self.event_votes.count - num_upvotes
    end
  end

end
