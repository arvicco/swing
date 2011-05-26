require 'spec_helper'
require 'swing/shared'

describe Swing::JMenuBar do

  context 'creation' do
    let(:new_args) { [] }

    it_behaves_like 'enhanced awt component'
    it_behaves_like 'tool tipped component'

    it 'allows to pass parent in as option' do
      @frame = Swing::JFrame.new 'Menu Test'
      bar = Swing::JMenuBar.new :parent => @frame
      bar.parent.should == @frame.layered_pane
      @frame.dispose
    end

    it 'allows to set menu structure via options' do
      # Creating Connect/Disconnect buttons (parentless - detached, for now)
      @connect_button = Swing::JButton.new('Connect')

      # Creating Menu Bar with buttons
      Swing::JMenuBar.new :structure =>
                              [
                                  @connect_button,
                                  @beep_button = Swing::JButton.new('Beep'),
                                  {:File => {:Exit => Proc.new { sleep 1 }}}
                              ]
    end
  end
end
