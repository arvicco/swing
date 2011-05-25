require 'swing'

class Swing::JFrame
#    include AttrSetter

  attr_setter :layout, :background, :size, :title,
              :default_close_operation => EXIT_ON_CLOSE #DISPOSE_ON_CLOSE, HIDE_ON_CLOSE

  def initialize *args

    super *args

    setup

    self.location_relative_to = nil
    self.visible = true
  end

  # Method that subclasses should override to set up their contents before
  # JFrame is made visible
  def setup
  end

end
