require 'spec_helper'

describe Spree.user_class do

  before(:each) do
    @user = Spree::User.create! :email => 'test@example.com', :password => 'spree123'
    @product1 = Spree::Product.create! :name => 'product1', :price => 100, :shipping_category_id => 1
    @product2 = Spree::Product.create! :name => 'product2', :price => 100, :shipping_category_id => 1
    favorite = Spree::Favorite.new
    favorite.favorable = @product1
    favorite.user_id = @user.id
    favorite.save!
  end

  it { should have_many(:favorites) }
  it { should have_many(:favorite_products).through(:favorites).class_name('Spree::Product') }

  describe 'has_favorite?' do
    context "when product in user's favorite products" do
      it { @user.has_favorite?(@product1).should be true }
    end

    context 'when product is not in users favorite products' do
      it { @user.has_favorite?(@product2).should be false }
    end
  end

end
