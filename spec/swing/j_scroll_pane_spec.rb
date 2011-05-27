require 'spec_helper'
require 'swing/shared'

describe Swing::JScrollPane do

  context 'creation' do
    let(:new_args) { [] }
    let(:layout) { Swing::ScrollPaneLayout.new }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'can be constructed given an enclosed element' do
      list = Swing::JList.new

      @pane = Swing::JScrollPane.new list, :preferred_size => [700, 900]
      @pane.viewport.components[0].should == list
      @pane.preferred_size.should == Awt::Dimension.new(700, 900)
    end

  end
end
