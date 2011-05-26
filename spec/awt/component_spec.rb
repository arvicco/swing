require 'spec_helper'
require 'awt/component'

describe 'java.awt.Component' do
  context 'defining new methods' do
    it 'changes derived Ruby subclases' do
      button = Swing::JButton.new 'Disconnect'
      button.should respond_to :blah
      button.blah
    end

    it 'changes derived pure Java subclases' do
      button = javax.swing.JButton.new 'Disconnect'
      button.should respond_to :blah
      button.blah
    end
  end

  context 'with Attributes extension' do
    it 'allows pure Java subclasses to accept options' do
      button = javax.swing.JButton.new 'Disconnect', :enabled => false
      button.should_not be_enabled
    end
  end
end
