class Profiles::User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :active, type: Boolean, default: false

  index({name: 1, email: 1})

  validates :email, presence: true
end
