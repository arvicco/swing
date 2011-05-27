require 'spec_helper'
require 'swing/shared'

describe Swing::JMenu do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

  end
end
