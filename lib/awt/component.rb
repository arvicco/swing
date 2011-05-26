require 'swing_support/extensions/attributes'

class Awt::Component

  # TODO: remove from spec suite
  def blah
  end

  include SwingSupport::Extensions::Attributes

  #    background       Color • •
  #    cursor           Cursor • • Cursor.DEFAULT_CURSOR
  #    enabled          boolean • • true
  #    font             Font • •
  #    foreground       Color • •
  #    layout           LayoutManager • • BorderLayout( )
  #    locale           Locale • •
  #    location         Point • •
  #    locationOnScreen Point • •
  #    name             String • • ""
  #    parent           Container • • null
  #    size             Dimension • •
  #    visible          boolean • • true
  #    ----Getters only - NO Setters!
  #    colorModel       ColorModel •
  #    component        (i) Component •
  #    componentCount   int •
  #    components       Component[] •
  #    insets           Insets • Insets(0,0,0,0)
  #    showing          boolean • true
  #    valid            boolean •

  attr_setter :background, :cursor, :enabled, :font, :foreground, :layout, :locale,
              :location, :location_on_screen, :name, :parent, :size, :visible
end
