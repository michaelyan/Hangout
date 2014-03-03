class Firehouse
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :borough, type: String
end
