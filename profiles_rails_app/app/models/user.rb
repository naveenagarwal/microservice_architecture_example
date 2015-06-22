class User
  include Her::Model

  include_root_in_json true

  attributes :name, :email, :active

  validates :email, presence: true
end
