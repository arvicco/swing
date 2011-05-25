require 'swing'

module Swing::JCheckBox

  attr_setter :selected

  def initialize *args, &block
    super *args

    # TODO: Probably need to implement ItemListener as well?
    self.addActionListener SwingSupport::ActionListener.new &block
  end
end # class JCheckBox
