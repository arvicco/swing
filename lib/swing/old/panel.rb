require 'swing/attr_setter'

module Swing

  class Panel < javax.swing.JPanel
    include AttrSetter

    attr_setter :layout, :background

    def initialize opts = {}
      set_attributes(opts) { super() }

      opts[:parent].add self if opts[:parent]
    end
  end # class Panel

end
