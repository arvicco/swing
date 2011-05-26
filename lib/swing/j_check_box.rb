require 'swing'

class Swing::JCheckBox

  attr_setter :selected
  attr_setter :tool_tip_text

  def initialize *args, &block
    super *args

    # TODO: Probably need to implement ItemListener as well?
    self.addActionListener SwingSupport::ActionListener.new &block
  end
end # class JCheckBox
