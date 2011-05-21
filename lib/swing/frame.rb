require 'swing/attr_setter'

import javax.swing.JFrame

module Clients

  # Swing-based GUI controls
  module SwingGui

    class Frame < JFrame
      include AttrSetter

      attr_setter :layout, :background, :size, :title,
                  :default_close_operation => JFrame::EXIT_ON_CLOSE #DISPOSE_ON_CLOSE, HIDE_ON_CLOSE

      def initialize name, opts = {}

        set_attributes(opts) { super(name) }

        setup opts

        self.location_relative_to = nil
        self.visible = true
      end

      # Method that subclasses should override to set up their contents before
      # Frame is made visible
      def setup opts
      end
    end
  end
end

