require 'rubygems'

include Java
Swing = javax.swing

require 'version'
require 'swing_support'
require 'awt'

require 'swing/j_component'
require 'swing/j_button'
require 'swing/j_check_box'
require 'swing/j_frame'
require 'swing/j_label'
require 'swing/j_list'
require 'swing/j_menu'
require 'swing/j_menu_bar'
require 'swing/j_menu_item'
require 'swing/j_panel'
require 'swing/j_scroll_pane'
require 'swing/j_split_pane'
require 'swing/j_table'
require 'swing/j_text_field'

module Swing
  Table = table
#  TODO: Impossible to auto-load, this is Swing package, not a Ruby module :(
#  autoload :JButton, "swing/j_button"
#  autoload :JCheckBox, "swing/j_check_box"
#  autoload :JButton, "swing/j_button"
#  autoload :JButton, "swing/j_button"
#  autoload :JButton, "swing/j_button"
#  autoload :JButton, "swing/j_button"
#  autoload :JButton, "swing/j_button"
#  autoload :Jdbc, "rubeus/jdbc"
#  autoload :Reflection, "rubeus/reflection"
#  autoload :Util, "rubeus/util"
end  # module Swing
