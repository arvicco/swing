require 'spec_helper'
require 'swing/shared'

describe Swing::JFrame do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced awt component'

    it 'is possible to create frame' do
      f = Swing::JFrame.new "Swing GUI",
                            :layout => Awt::FlowLayout.new(Awt::FlowLayout::LEFT),
                            :size => [1100, 1200]
    end
  end
end
