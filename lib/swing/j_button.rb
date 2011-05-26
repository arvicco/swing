require 'swing'

class Swing::JButton

  attr_setter :tool_tip_text

  def initialize *args, &block
    super *args

    self.addActionListener SwingSupport::ActionListener.new &block
  end
end # class JButton
