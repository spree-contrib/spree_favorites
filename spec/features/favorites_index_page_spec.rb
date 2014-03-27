require 'spec_helper'

describe "Favorites - Index Page", js: true do

  let!(:product) { create(:product) }
  let!(:user) { create(:user) }
  let!(:favorite) { create(:favorite, favorable: product, user: user) }

  context 'as Guest' do

    before do
      visit spree.product_path(product)
      click_link 'Add Favorite'
      expect(page).to have_content('Remove Favorite')
      visit spree.favorites_path
    end

    it 'should allow removing favorites' do
      expect(page).to have_content(product.name)
      click_link 'Remove'
      expect(page).not_to have_content(product.name)
    end

  end

  context 'as User' do

    before do
      login_user user
      visit spree.favorites_path
    end

    it 'should allow removing favorites' do
      expect(page).to have_content(product.name)
      click_link 'Remove'
      expect(page).not_to have_content(product.name)
    end

  end

end
