require 'swing/attr_setter'

module Swing

  # Scroll Pane around given scrollable component
  class ScrollPane < javax.swing.JScrollPane
    include AttrSetter

    attr_setter :horizontal_scroll_bar_policy, :vertical_scroll_bar_policy

    def initialize component, opts = {}
      set_attributes(opts) { super(component) }

      opts[:parent].add self if opts[:parent]
    end
  end # class Panel

end
