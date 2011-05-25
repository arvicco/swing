require 'spec_helper'

describe Swing::JButton do
  it 'is possible to set :enabled attribute to false' do
    button = Swing::JButton.new 'Disconnect', :enabled => false
    button.should_not be_enabled
  end
end
