require 'spec_helper'
require 'swing/shared'

describe Swing::JScrollPane do

  context 'creation' do
    let(:new_args) { [] }
    let(:layout) { Swing::ScrollPaneLayout.new   }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

  end
end
