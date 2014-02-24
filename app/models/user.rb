class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :fb_id, type: Integer
  field :username, type: String
  field :password, type: String
end
