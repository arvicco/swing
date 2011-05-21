require 'swing/action_listener'
require 'swing/attr_setter'

module Clients
  module Swing

    class CheckBox < javax.swing.JCheckBox
      include AttrSetter

      attr_setter :selected

      def initialize text, opts = {}, &block
        set_attributes(opts) { super(text) }

        # TODO: Probably need to implement ItemListener as well?
        self.addActionListener ActionListener.new &block

        opts[:parent].add self if opts[:parent]
      end
    end # class CheckBox

  end
end
