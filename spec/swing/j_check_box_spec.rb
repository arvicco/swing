require 'spec_helper'
require 'swing/shared'

describe Swing::JCheckBox do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'is possible to set :selected attribute' do
      box = Swing::JCheckBox.new 'Disconnect', :selected => true
      box.should be_selected
    end
  end
end
