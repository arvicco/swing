require 'swing'
require 'swing/action_listener'

module Swing

  class JButton

    attr_setter :enabled

    def initialize text, opts = {}, &block
      set_attributes(opts) { super(text) }

      self.addActionListener ActionListener.new &block

      opts[:parent].add self if opts[:parent]
    end
  end # class Button
end
