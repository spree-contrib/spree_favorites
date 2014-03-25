require 'spec_helper'

describe "Favorites - Product Page", js: true do

  let!(:product) { create(:product) }

  context 'as Guest' do

    before do
      pending 'TODO next'
      visit spree.product_path(product)
    end

    it 'should allow adding and removing favorites' do
      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')
      click_link 'Remove Favorite'
      expect(page).to have_content('Add Favorite')
    end

  end

  context 'as User' do

    before do
      login_user create(:user)
      visit spree.product_path(product)
    end

    it 'should allow adding and removing favorites' do
      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')
      click_link 'Remove Favorite'
      expect(page).to have_content('Add Favorite')
    end

  end

end
