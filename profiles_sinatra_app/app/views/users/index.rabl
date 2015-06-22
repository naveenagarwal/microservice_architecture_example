collection @users

extends("users/user")
node(:id) { |user| user.id.to_s }
