# Merges users favorites to their account after sign in and sign up.
Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
  if auth.cookies.signed[:guest_token].present?
    Spree::Favorite.where(guest_token: auth.cookies.signed[:guest_token]).update_all(user_id: user.id, guest_token: nil)
  end
end
