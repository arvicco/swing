require 'swing_support/extensions'

module SwingSupport
  # Class that implements ActionListener interface around a given block
  class ActionListener
    java_implements java.awt.event.ActionListener

    def initialize &block
      @listener_block = block
    end

    java_signature 'public void actionPerformed(ActionEvent event)'
    # from ActionListener interface: Invoked when an action event occurs.
    def actionPerformed event
      @listener_block.call event
    end
  end
end

