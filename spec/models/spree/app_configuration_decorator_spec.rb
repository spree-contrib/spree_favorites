describe Spree::AppConfiguration do
  it { Spree::Config.favorites_per_page.should eq 12 }
end