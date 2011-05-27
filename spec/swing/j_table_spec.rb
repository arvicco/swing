require 'spec_helper'
require 'swing/shared'

describe Swing::JTable do

  context 'creation' do
    let(:new_args) { [2, 2] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

  end
end
