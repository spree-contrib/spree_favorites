require 'spec_helper'

describe "Favorites - Product Page", js: true do

  let!(:product) { create(:product) }

  context 'as Guest' do

    before do
      visit spree.product_path(product)
    end

    it 'should allow adding and removing favorites' do
      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')
      click_link 'Remove Favorite'
      expect(page).to have_content('Add Favorite')
    end

    it 'should default to remove link if visiting a favorite' do
      visit spree.product_path(product)

      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')

      # Reload page to ensure cookies persisting.
      visit spree.product_path(product)

      click_link 'Remove Favorite'
      expect(page).to have_content('Add Favorite')
    end

  end

  context 'as User' do

    let!(:user) { create(:user) }

    before do
      login_user user
      visit spree.product_path(product)
    end

    it 'should allow adding and removing favorites' do
      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')
      click_link 'Remove Favorite'
      expect(page).to have_content('Add Favorite')
    end

    it 'should default to remove link if visiting a favorite' do
      fav_product = create(:product)
      create(:favorite, favorable: fav_product, user: user)
      visit spree.product_path(fav_product)

      click_link 'Remove Favorite'
      expect(page).to have_content('Add Favorite')
    end

  end

end
