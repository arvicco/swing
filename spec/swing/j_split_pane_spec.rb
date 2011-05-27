require 'spec_helper'
require 'swing/shared'

describe Swing::JSplitPane do

  context 'creation' do
    let(:new_args) { [] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'is possible to use constructor with two children' do
      b1 = Swing::JButton.new 'First'
      b2 = Swing::JButton.new 'Second'
      pane = Swing::JSplitPane.new b1, b2, :tool_tip_text => 'Blah'
      pane.tool_tip_text.should == 'Blah'
      pane.left_component.should == b1
      pane.right_component.should == b2
    end

  end
end
