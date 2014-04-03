class Event
  include Mongoid::Document
  field :name, type: String
  field :details, type: String
  field :location, type: String
  field :start_time, type: Time
  field :end_time, type: Time

  belongs_to :hangout_event
  embeds_many :event_votes
  embeds_many :event_comments

  def upvote_or_downvote(upvote_or_downvote, user_id)
    self.event_votes.each do |vote|
      if vote.user_id == user_id 
        if upvote_or_downvote == vote.up #user voted the same way
          vote.destroy
          return
        elsif upvote_or_downvote != vote.up #user changed their vote
          vote.destroy
          self.event_votes.create(up: upvote_or_downvote, user_id: user_id)
          return
        end
      end
    end
    #otherwise it is a new vote
    self.event_votes.create(up: upvote_or_downvote, user_id: user_id)
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
    self.event_votes.each do |vote|
      if vote.up == true
        num_upvotes += 1
      end
    end

    if (upvote_or_downvote)
      return num_upvotes
    else
      return self.event_votes.count - num_upvotes
    end
  end

  def add_comment(text, user_id)
    self.event_comments.create(text: text, timestamp: DateTime.now, user_id: user_id)
  end

  def upvotes_by
    users = []
    self.event_votes.each do |vote|
      if vote.up == true
        users.push(User.find(vote.user_id))
      end
    end
    return users
  end

  def downvotes_by
    users = []
    self.event_votes.each do |vote|
      if vote.up == false
        users.push(User.find(vote.user_id))
      end
    end
    return users
  end
end
