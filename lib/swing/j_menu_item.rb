require 'swing'

class Swing::JMenuItem

  def initialize text, &block
    super text
    self.addActionListener SwingSupport::ActionListener.new &block
  end

end
