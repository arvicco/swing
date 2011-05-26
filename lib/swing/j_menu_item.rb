require 'swing'

class Swing::JMenuItem

  attr_setter :tool_tip_text

  def initialize text, &block
    super text
    self.addActionListener SwingSupport::ActionListener.new &block
  end

end
