shared_examples_for 'enhanced awt component' do

  context 'new with common options' do
    it 'is possible to create components with settable attribute' do
      p described_class.attributes
      background = Awt::Color.new(1, 2, 3)
      cursor = Awt::Cursor.new Awt::Cursor::HAND_CURSOR #DEFAULT_CURSOR
      enabled = false
      font = Awt::Font.new("Trebuchet", Awt::Font::PLAIN, 11)
      new_args.push :background => background, :cursor => cursor, :enabled => enabled,
                    :font => font, :name => 'Blah'
      component = described_class.new *new_args
      component.background.should == background
      component.cursor.should == cursor
      component.enabled?.should == false
      component.font.should == font
      component.name.should == 'Blah'
      component.parent.should == nil
    end
  end

#  context 'new with options (without parent)' do
#    {Swing::JLabel => 'Text', Swing::JButton => 'Text', Swing::JCheckBox => 'Text',
#     Swing::JFrame => 'Text', Swing::JList => [], Swing::JMenu => [], Swing::JMenuBar=> [],
#     Swing::JMenuItem => [], Swing::JPanel => [], Swing::JScrollPane => [],
#     Swing::JSplitPane => [], Swing::JTable => [2, 2]}.each do |klass, args|
#      it 'is possible to create components with settable attribute' do
#        p klass.attributes
#        constructor_args.push constructor_options
#        component = klass.new(*args, :name => 'Blah')
#        component.name.should == 'Blah'
#        component.parent.should == nil
#      end
#    end
#  end
end
#{Swing::JLabel => 'Text', Swing::JButton => 'Text', Swing::JCheckBox => 'Text',
# Swing::JFrame => 'Text', Swing::JList => [], Swing::JMenu => [], Swing::JMenuBar=> [],
# Swing::JMenuItem => [], Swing::JPanel => [], Swing::JScrollPane => [],
# Swing::JSplitPane => [], Swing::JTable => [2, 2]}.each do |klass, args|
