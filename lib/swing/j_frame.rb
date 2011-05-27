require 'swing'

class Swing::JFrame

  #    contentPane              Container • • From rootPane
  #    defaultCloseOperation    int • • HIDE_ON_CLOSE
  #    glassPane                Component • • From rootPane
  #    JMenuBar                 JMenuBar • • From rootPane
  #    layeredPane              JLayeredPane • • From rootPane
  #    layout                   LayoutManager • • BorderLayout( )
  #    rootPane                 JRootPane • • JRootPane( )
  #    rootPaneCheckingEnabled  boolean • • true
  #    title                    String • • ""
  #    ----Getters only - NO Setters!
  #    accessibleContexto AccessibleContext • JFrame.Accessible-JFrame( )

  attr_setter :title, :default_close_operation => EXIT_ON_CLOSE #DISPOSE_ON_CLOSE, HIDE_ON_CLOSE

  def initialize *args #, &block
    super *args #, &nil

#    # Yielding self to set up contents before making frame visible
#    yield self if block_given?

#    self.pack
#    self.location_relative_to = nil
#    self.visible = true
  end
end
