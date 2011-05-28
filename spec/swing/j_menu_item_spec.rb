require 'spec_helper'
require 'swing/shared'

describe Swing::JMenuItem do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'accepts action listener block' do
      item = Swing::JMenuItem.new('Test') { @block_called = true}
      @block_called.should be_false

      item.do_click
      @block_called.should be_true
    end

  end
end
