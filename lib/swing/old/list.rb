require 'swing/attr_setter'

# Swing-based GUI controls
module Swing

  class List < javax.swing.JList
    include AttrSetter

    def initialize model, opts = {}
      set_attributes(opts) { super(model) }

      opts[:parent].add self if opts[:parent]
    end
  end # class List

end
