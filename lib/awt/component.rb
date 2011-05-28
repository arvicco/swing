require 'swing_support/extensions/attributes'
require 'swing_support/extensions/blocks'

class Awt::Component

  include SwingSupport::Extensions::Attributes
  include SwingSupport::Extensions::Blocks

  #    background       Color • •
  #    cursor           Cursor • • Cursor.DEFAULT_CURSOR
  #    enabled          boolean • • true
  #    font             Font • •
  #    foreground       Color • •
  #    layout           LayoutManager • • BorderLayout( )
  #    locale           Locale • •
  #    location         Point • •
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
  #    locationOnScreen Point • •
  #    showing          boolean • true
  #    valid            boolean •

  attr_setter :enabled, :layout,
              :locale, :location, :name, :size, :visible,
              :background => Awt::Color, :foreground => Awt::Color,
              :font => Awt::Font, :cursor => Awt::Cursor
end
