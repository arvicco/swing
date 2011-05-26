require 'spec_helper'
require 'swing/shared'

describe Swing::JPanel do

  context 'creation' do
    let(:new_args) { [] }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

  end
end
