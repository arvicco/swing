require 'spec_helper'
require 'swing/shared'

describe Swing::JCheckBox do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

    it 'is possible to set :selected attribute' do
      box = Swing::JCheckBox.new 'Disconnect', :selected => true
      box.should be_selected
    end
  end
end
