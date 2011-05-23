require 'spec_helper'

describe Swing::Button do
  it 'is possible to set :enabled attribute to false' do
    button = Swing::Button.new 'Disconnect', :enabled => false
    button.should_not be_enabled
  end
end
