require 'spec_helper'
require 'swing/shared'

describe Swing::JTable do

  context 'creation' do
    let(:new_args) { [2, 2] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'allows to set properties via constructor' do
      model = Class.new(Swing::Table::DefaultTableModel).new
      column_model = Class.new(Swing::Table::DefaultTableColumnModel).new
      field = Swing::JTextField.new
      editor = Class.new(Swing::DefaultCellEditor).new field
      header = Class.new(Swing::Table::JTableHeader).new
      selection_model = Class.new(Swing::DefaultListSelectionModel).new
      properties = {
          :auto_create_columns_from_model => true,
          :auto_resize_mode => Swing::JTable::AUTO_RESIZE_ALL_COLUMNS,
          :row_height => 21,
          :model => model,
          :column_model => column_model,
          :selection_model => selection_model,
          :drag_enabled => true,
          :cell_editor => editor,
          :row_margin => 13,
          :show_horizontal_lines => false,
          :show_vertical_lines => false,
          :table_header => header,
          :cell_selection_enabled => false,
          :row_selection_allowed => true,
      }
      @table = described_class.new *(new_args.push properties)
#      p @table.methods.sort.grep /election/
      properties.each do |name, value|
        p name, value
        @table.send(name).should == value
      end
    end

    it 'auto-creates appropriate property classes as needed' do
      properties = {
          :grid_color => [1, 2, 3],
          :intercell_spacing => [1, 1],
          :preferred_scrollable_viewport_size => [100, 100],
          :selection_background => [1, 2, 3],
          :selection_foreground => [3, 2, 1],
      }
      @table = described_class.new *(new_args.push properties)
      properties.each do |name, value|
        @table.send(name).should == @table.class.attributes[name].new(*value)
      end
    end

    it 'also sets some options without getter equivalent' do
      properties = {
          :selection_mode => Swing::ListSelectionModel::SINGLE_INTERVAL_SELECTION,
          :show_grid => false,
      }
      @table = described_class.new *(new_args.push properties)
    end

    it 'unable to set this combination of properties for some reason', :failing => true do
      properties = {
          :cell_selection_enabled => false,
          :row_selection_allowed => true,
          :column_selection_allowed => true,
      }
      @table = described_class.new *(new_args.push properties)
      properties.each do |name, value|
        p name, value
        @table.send(name).should == value
      end
    end

  end
end
