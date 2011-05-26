require 'swing'
require 'swing/j_menu'
require 'swing/j_menu_item'

class Swing::JMenuBar

  attr_setter :tool_tip_text

  # Override post-processing (non-setter) options given to initialize
  def post_process opts
    super
    # Create menu structure from :structure opt
    if opts[:structure]
      [opts[:structure]].flatten.each do |element|
        case element
          when Hash # Hash defines menu structure
            element.each do |menu_name, menu_structure|
              menu = Swing::JMenu.new menu_name.to_s, :parent => self
              menu_structure.each do |item_name, item_action|
                Swing::JMenuItem.new item_name.to_s, :parent => menu, &item_action
              end
            end
          else
            self.add element
        end
      end
    end
  end

  # Proper way to add menu bar to its parent
  def attach_to parent
    parent.setJMenuBar self if parent and parent.respond_to? :setJMenuBar
  end
end
