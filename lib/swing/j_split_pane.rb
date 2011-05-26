require 'swing'

class Swing::JSplitPane

  attr_setter :tool_tip_text
  attr_setter :one_touch_expandable, :orientation, :continuous_layout,
              :divider_size, :divider_location, :resize_weight

  def initialize *args
    if args.size == 2
      super HORIZONTAL_SPLIT, *args
    else
      super *args
    end
  end
end # class JSplitPane
