object @user

if @user.errors.present?
  extends("users/errors")
else
  node(:success) { |user| "User record destroyed successfully" }
end
