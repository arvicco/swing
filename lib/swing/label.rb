require 'swing/action_listener'
require 'swing/attr_setter'

module Clients
  module Swing

    class Label < javax.swing.JLabel
      include AttrSetter

      def initialize text, opts = {}, &block
        set_attributes(opts) { super(text) }
        opts[:parent].add self if opts[:parent]
      end
    end # class Label
  end
end
