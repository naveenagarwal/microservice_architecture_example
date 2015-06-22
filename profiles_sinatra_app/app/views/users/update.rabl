object @user

if @user.errors.present?
  extends("users/errors")
else
  extends("users/user")
  node(:id) { |user| user.id.to_s }
end
