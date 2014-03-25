require 'spec_helper'

describe Spree::Favorite do

  it { should belong_to(:favorable) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:favorable) }
  it { should validate_presence_of(:user) }

end