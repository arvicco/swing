require 'spec_helper'
require 'swing/shared'

describe Swing::JButton do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'is possible to set :enabled attribute to false' do
      button = Swing::JButton.new 'Disconnect', :enabled => false
      button.should_not be_enabled
    end
  end
end
