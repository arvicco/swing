require 'swing'

module Swing::JSplitPane

  attr_setter :one_touch_expandable, :orientation, :continuous_layout,
              :divider_size, :divider_location, :resize_weight

  def initialize first, second, opts = {}
    super(HORIZONTAL_SPLIT, first, second)
  end
end # class JSplitPane
