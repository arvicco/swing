require 'spec_helper'
require 'awt/component'

describe 'java.awt.Component' do
  context 'defining new methods' do
    [Swing::JButton, javax.swing.JButton, Swing::JLabel, Swing::Box].each do |klass|

      it "changes derived subclases #{klass}" do
        component = klass == Swing::Box ? klass.new(1) : klass.new('Test')
        component.should respond_to :attach_to
        component.should respond_to :post_process
      end
    end
  end

  context 'with Attributes extension' do
    it 'allows pure Java subclasses to accept options' do
      button = javax.swing.JButton.new 'Disconnect', :enabled => false
      button.should_not be_enabled
    end
  end
end
