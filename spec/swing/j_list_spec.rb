require 'spec_helper'
require 'swing/shared'

describe Swing::JList do

  context 'creation' do

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

  end
end
