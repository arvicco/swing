require 'swing/menu'
require 'swing/menu_item'
require 'swing/attr_setter'

module Swing

  class MenuBar < javax.swing.JMenuBar
    include AttrSetter

    def initialize opts = {}
      set_attributes(opts) { super() }

      if opts[:structure]
        [opts[:structure]].flatten.each do |element|
          case element
            when Hash # Hash defines menu structure
              element.each do |menu_name, menu_structure|
                menu = Menu.new menu_name.to_s, :parent => self
                menu_structure.each do |item_name, item_action|
                  MenuItem.new item_name.to_s, :parent => menu, &item_action
                end
              end
            else
              self.add element
          end
        end
      end
      opts[:parent].setJMenuBar self if opts[:parent]
    end
  end

end
