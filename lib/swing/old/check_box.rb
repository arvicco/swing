require 'swing'
require 'swing/action_listener'

module Swing
  class CheckBox < javax.swing.JCheckBox

    attr_setter :selected

    def initialize text, opts = {}, &block
      set_attributes(opts) { super(text) }

      # TODO: Probably need to implement ItemListener as well?
      self.addActionListener ActionListener.new &block

      opts[:parent].add self if opts[:parent]
    end
  end # class CheckBox
end
