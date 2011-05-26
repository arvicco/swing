require 'spec_helper'
require 'swing/shared'

describe Swing::JTable do

  context 'creation' do
    let(:new_args) { [2,2] }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

  end
end
