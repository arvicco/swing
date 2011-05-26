require 'swing'

class Swing::JFrame

  attr_setter :layout, :background, :size, :title,
              :default_close_operation => EXIT_ON_CLOSE #DISPOSE_ON_CLOSE, HIDE_ON_CLOSE

  def initialize *args
    super *args

    # Yielding self to set up contents before making frame visible
    yield self if block_given?

    self.location_relative_to = nil
    self.visible = true
  end
end
