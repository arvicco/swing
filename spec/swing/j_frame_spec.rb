require 'spec_helper'
require 'swing/shared'

describe Swing::JFrame do

  context 'creating' do
    after(:each) {@frame.dispose if @frame}
    let(:new_args) { ['Frame'] }

    it_behaves_like 'enhanced awt component'

    it 'is possible to create Frame with options' do
      @frame = Swing::JFrame.new "Swing GUI",
                            :layout => Awt::FlowLayout.new(Awt::FlowLayout::LEFT),
                            :size => [1100, 1200]
    end


  end
end
