include Java

module Clients

  module SwingGui
    # Class that implements ActionListener interface around a given block
    class ActionListener
      java_implements java.awt.event.ActionListener

      def initialize &block
        @action_block = block
      end

      java_signature 'public void actionPerformed(ActionEvent event)'
      # from ActionListener interface: Invoked when an action event occurs.
      def actionPerformed event
        @action_block.call event
      end
    end
  end
end

