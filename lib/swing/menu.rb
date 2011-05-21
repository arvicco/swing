require 'swing/attr_setter'

module Swing

  class Menu < javax.swing.JMenu
    include AttrSetter

    def initialize text, opts = {}
      set_attributes(opts) { super text }
      opts[:parent].add self if opts[:parent]
    end
  end

end
