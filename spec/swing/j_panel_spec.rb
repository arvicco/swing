require 'spec_helper'
require 'swing/shared'

describe Swing::JPanel do

  context 'creation' do
    let(:new_args) { [] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

  end
end
