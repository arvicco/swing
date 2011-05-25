require 'swing'

class Swing::JMenuItem

  def initialize text, opts = {}, &block
    super text
    self.addActionListener SwingHelper::ActionListener.new &block
  end
end
