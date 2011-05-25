require 'swing'

module Swing::JMenuItem

  def initialize text, opts = {}, &block
    super text
    self.addActionListener SwingHelper::ActionListener.new &block
  end
end
