require 'swing'

class Swing::JMenuItem
  attr_setter :tool_tip_text

  def initialize text, opts = {}, &block
    super text
    self.addActionListener SwingHelper::ActionListener.new &block
  end
end
