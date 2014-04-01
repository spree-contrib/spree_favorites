require 'spec_helper'

describe "Favorites - User Tracking", js: true do

  let!(:product) { create(:product) }
  let!(:user) { create(:user) }

  context 'as Guest' do

    before do
      visit spree.product_path(product)
    end

    it 'should merge to next customer sign in' do
      expect(user.favorites.count).to eql(0)

      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')

      visit spree.login_path
      fill_in 'spree_user_email', with: user.email
      fill_in 'spree_user_password', with: 'secret'
      click_button 'Login'

      page.should have_content('Logged in successfully')
      expect(user.favorites.count).to eql(1)
      expect(Spree::Favorite.last.guest_token).to be_nil
    end

    it 'should merge to next customer sign up' do
      expect(Spree::Favorite.count).to eql(0)

      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')

      visit spree.signup_path
      fill_in 'spree_user_email', with: 'test@example.com'
      fill_in 'spree_user_password', with: 'secret'
      fill_in 'spree_user_password_confirmation', with: 'secret'
      click_button 'Create'

      page.should have_content('Welcome! You have signed up successfully.')
      expect(Spree.user_class.last.favorites.count).to eql(1)
      expect(Spree::Favorite.last.guest_token).to be_nil
    end

  end

end
