require 'swing'

class Swing::JButton

  attr_setter :enabled

  def initialize *args, &block
    super *args

    self.addActionListener SwingSupport::ActionListener.new &block
  end
end # class JButton
