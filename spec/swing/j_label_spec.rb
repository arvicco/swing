require 'spec_helper'
require 'swing/shared'

describe Swing::JLabel do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced awt component'

    it 'is possible to set :tool_tip_text attribute' do
      label = Swing::JLabel.new 'Disconnect', :tool_tip_text => 'Blah'
      label.tool_tip_text.should == 'Blah'
    end
  end
end
