require 'swing'

class Swing::JCheckBox

  attr_setter :selected

  def add_block_listener &block
    # TODO: Probably need to implement ItemListener as well?
    self.addActionListener SwingSupport::ActionListener.new &block
  end

end # class JCheckBox
