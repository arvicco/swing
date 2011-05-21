require 'swing/action_listener'
require 'swing/attr_setter'

module Clients

  # Swing-based Menu elements
  module SwingGui

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

    class Menu < javax.swing.JMenu
      include AttrSetter

      def initialize text, opts = {}
        set_attributes(opts) { super text }
        opts[:parent].add self if opts[:parent]
      end
    end

    class MenuItem < javax.swing.JMenuItem
      include AttrSetter

      def initialize text, opts = {}, &block
        set_attributes(opts) { super text }
        self.addActionListener ActionListener.new &block
        opts[:parent].add self if opts[:parent]
      end
    end

  end
end

