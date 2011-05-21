require 'swing/attr_setter'

import javax.swing.JSplitPane

module Swing

  class SplitPane < JSplitPane
    include AttrSetter

    attr_setter :one_touch_expandable, :orientation, :continuous_layout,
                :divider_size, :divider_location, :resize_weight

    def initialize first, second, opts = {}
      set_attributes(opts) { super(JSplitPane::HORIZONTAL_SPLIT, first, second) }

      opts[:parent].add self if opts[:parent]
    end
  end # class Panel

end
