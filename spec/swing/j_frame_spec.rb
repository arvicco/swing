require 'spec_helper'
require 'swing/shared'

describe Swing::JFrame do

  context 'creating' do
    after(:each) { @frame.dispose if @frame }
    let(:new_args) { ['Frame'] }

    it_behaves_like 'enhanced awt component'

    it 'is possible to create Frame with options' do
      @frame = Swing::JFrame.new "Option frame",
                                 :layout => Awt::FlowLayout.new(Awt::FlowLayout::LEFT),
                                 :size => [1100, 1200]
    end

    it 'is possible to give frame constructor a block' do
      @frame = Swing::JFrame.new("Block frame") { @called = true }
      @called.should be_true
    end

  end
end
