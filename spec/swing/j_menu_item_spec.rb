require 'spec_helper'
require 'swing/shared'

describe Swing::JMenuItem do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

  end
end
