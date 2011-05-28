require 'swing'

class Swing::JMenuItem

  def add_block_listener &block
    self.addActionListener SwingSupport::ActionListener.new &block
  end

end
