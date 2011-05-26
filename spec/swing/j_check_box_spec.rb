require 'spec_helper'
require 'swing/shared'

describe Swing::JCheckBox do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced awt component'

    it 'is possible to set :selected attribute' do
      box = Swing::JCheckBox.new 'Disconnect', :selected => true
      box.should be_selected
    end

    it 'is possible to set :tool_tip_text attribute' do
      box = Swing::JCheckBox.new 'Disconnect', :tool_tip_text => 'Blah'
      box.tool_tip_text.should == 'Blah'
    end
  end
end
