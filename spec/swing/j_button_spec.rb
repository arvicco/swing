require 'spec_helper'
require 'swing/shared'

describe Swing::JButton do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

    it 'is possible to set :enabled attribute to false' do
      button = Swing::JButton.new 'Disconnect', :enabled => false
      button.should_not be_enabled
    end
  end
end
