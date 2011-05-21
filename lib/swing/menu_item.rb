require 'swing/action_listener'
require 'swing/attr_setter'

module Clients
  module Swing

    class MenuItem < javax.swing.JMenuItem
      include AttrSetter

      def initialize text, opts = {}, &block
        set_attributes(opts) { super text }
        self.addActionListener ActionListener.new &block
        opts[:parent].add self if opts[:parent]
      end
    end

  end
end

