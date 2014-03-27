# Merges users favorites to their account after sign in and sign up.
Warden::Manager.after_set_user do |user, auth, opts|
  if auth.cookies.signed[:user_token].present?
    Spree::Favorite.where(user_token: auth.cookies.signed[:user_token]).update_all(user_id: user.id, user_token: nil)
  end
end
