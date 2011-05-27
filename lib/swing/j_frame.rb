require 'swing'

class Swing::JFrame

  attr_setter :title, :default_close_operation => EXIT_ON_CLOSE #DISPOSE_ON_CLOSE, HIDE_ON_CLOSE

  def initialize *args, &block
    super *args, &nil

    # Yielding self to set up contents before making frame visible
    yield self if block_given?

    self.pack
    self.location_relative_to = nil
    self.visible = true
  end
end
