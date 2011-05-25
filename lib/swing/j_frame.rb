require 'swing'

class Swing::JFrame
#    include AttrSetter

  attr_setter :layout, :background, :size, :title,
              :default_close_operation => JFrame::EXIT_ON_CLOSE #DISPOSE_ON_CLOSE, HIDE_ON_CLOSE

  def initialize *args

    super *args

#    setup opts

    self.location_relative_to = nil
    self.visible = true
  end

  # Method that subclasses should override to set up their contents before
  # Frame is made visible
  def setup opts
  end

end
