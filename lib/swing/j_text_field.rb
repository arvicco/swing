require 'swing'

class Swing::JTextField

  #  action                 Action • • null
  #  columns                int • • 0
  #  document               Document • • PlainDocument( )
  #  horizontalAlignment    int • • LEADING
  #  scrollOffset           int • • From horizontal visibility
  #  ----Getters only - NO Setters!
  #  accessibleContext      AccessibleContext • AccessibleJTextField
  #  actions                Action[] • From superclass plus NotifyAction
  #  horizontalVisibility   BoundedRangeModel • DefaultBoundedRangeModel
  #  UIClassIDo             String • "TextFieldUI"
  #  ----Problematic or unimplemented!
  #  actionCommand          String • null
  #
  attr_setter :action, :columns, :document, :horizontal_alignment, :scroll_offset

  def add_block_listener &block
    self.addActionListener SwingSupport::ActionListener.new &block
  end

end # class JTextField
