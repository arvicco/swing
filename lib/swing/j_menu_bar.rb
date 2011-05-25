require 'swing'
require 'swing/j_menu'
require 'swing/j_menu_item'

module Swing::JMenuBar

  def initialize opts = {}
    super opts

    if opts[:structure]
      [opts[:structure]].flatten.each do |element|
        case element
          when Hash # Hash defines menu structure
            element.each do |menu_name, menu_structure|
              menu = JMenu.new menu_name.to_s, :parent => self
              menu_structure.each do |item_name, item_action|
                JMenuItem.new item_name.to_s, :parent => menu, &item_action
              end
            end
          else
            self.add element
        end
      end
    end
  end

  # Post-processing (non-setter) options given to initialize
  def self.add_component component, parent
    parent.setJMenuBar component if parent
  end

end
