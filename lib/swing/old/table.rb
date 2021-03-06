require 'swing/attr_setter'

# Swing-based GUI controls
module Swing

  class Table < javax.swing.JTable
    include AttrSetter

    #    autoCreateColumnsFromModel boolean � � false
    #    autoResizeMode             int � � AUTO_RESIZE_ALL_COLUMNS
    #    columnModel                TableColumnModel � � DefaultTableColumnModel( )
    #    model                      TableModel � � DefaultTableModel( )
    #    rowHeight                  int � � 16
    #    cellSelectionEnabled       boolean � � false
    #    columnSelectionAllowed     boolean � � false
    #    rowSelectionAllowed        boolean � � true
    #    selectionMode              int � MULTIPLE_INTERVAL_SELECTION
    #    selectionModel             ListSelectionModel � � DefaultListSelectionModel
    #    cellEditor                 TableCellEditor � � null
    #    dragEnabled                boolean � � false
    #    gridColor                  Color � � From L&F
    #    intercellSpacing           Dimension � � Dimension(1, 1)
    #    preferredScrollableViewportSize Dimension � � Dimension(450, 400)
    #    rowMargin                  int � � 1
    #    selectionBackground       Color � � From L&F
    #    selectionForeground       Color � � From L&F
    #    showGrid                   boolean  � true
    #    showHorizontalLines        boolean � � true
    #    showVerticalLines          boolean � � true
    #    tableHeader                JTableHeader � � JTableHeader(column-Model)
    #    ----Getters only - NO Setters!
    #    columnCount          int � 0
    #    rowCount             int � 0
    #    selectedColumn       int � -1
    #    selectedColumnCount  int � 0
    #    selectedColumns      int[] � int[0]
    #    selectedRow          int � -1
    #    selectedRowCount     int � 0
    #    selectedRows         int[] � int[0]
    #    accessibleContext    AccessibleContext � JTable.AccessibleJTable
    #    scrollableTracksViewportHeighto boolean � false
    #    scrollableTracksViewportWidtho boolean � false

    attr_setter :auto_create_columns_from_model, :auto_resize_mode, :row_height,
                :model, :column_model, :selection_model,
                :drag_enabled, :cell_editor, :grid_color, :intercell_spacing,
                :preferred_scrollable_viewport_size, :row_margin,
                :selection_background, :selection_foreground, :show_grid,
                :show_horizontal_lines, :show_vertical_lines, :table_header,
                :selection_mode => javax.swing.ListSelectionModel::SINGLE_SELECTION,
                :cell_selection_enabled => true,
                :row_selection_allowed => false,
                :column_selection_allowed => false

    def initialize rows, columns, opts = {}
      set_attributes(opts) { super rows, columns }

      opts[:parent].add self if opts[:parent]
    end
  end # class Table

end
