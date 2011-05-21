require 'swing/action_listener'
require 'swing/attr_setter'

module Clients

  # Swing-based GUI controls
  module SwingGui

    class Button < javax.swing.JButton
      include AttrSetter

      attr_setter :enabled

      def initialize text, opts = {}, &block
        set_attributes(opts) { super(text) }

        self.addActionListener ActionListener.new &block

        opts[:parent].add self if opts[:parent]
      end
    end # class Button

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

    class Label < javax.swing.JLabel
      include AttrSetter

      def initialize text, opts = {}, &block
        set_attributes(opts) { super(text) }
        opts[:parent].add self if opts[:parent]
      end
    end # class Label
  end
end
