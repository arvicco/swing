require 'swing'

class Swing::JButton

  def add_block_listener &block
    self.addActionListener SwingSupport::ActionListener.new &block
  end

end # class JButton
