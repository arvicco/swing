shared_examples_for 'enhanced awt component' do

  def should_be_all_set component, attributes

  end

  after(:each) { @component.dispose if @component.respond_to? :dispose }

  context 'new with common options' do
    it 'is possible to create this component with settable attribute' do
#      p described_class.attributes
      component_attributes = {
          :background => Awt::Color.new(1, 2, 3),
          :foreground => Awt::Color.new(3, 2, 1),
          :cursor => Awt::Cursor.new(Awt::Cursor::HAND_CURSOR),
          :enabled => false,
          :visible => false,
          :font => Awt::Font.new("Trebuchet", Awt::Font::PLAIN, 11),
          :layout => (defined?(layout) ? layout : Awt::FlowLayout.new),
          :location => Awt::Point.new(10, 20),
          :size => Awt::Dimension.new(300, 300),
          :name => 'Blah',
      }
      @component = described_class.new *(new_args.push component_attributes)
      component_attributes.each do |name, value|
        @component.send(name).should == value
      end
    end
  end

  context 'new with parent' do
    unless described_class == Swing::JFrame || described_class == Swing::JMenuBar
      it 'is possible to set parent via options' do
        parent = Swing::JPanel.new
        @component = described_class.new *(new_args.push :parent => parent)
        @component.parent.should == parent
      end
    end
  end
end

shared_examples_for 'tool tipped component' do
  it 'is possible to set :tool_tip_text attribute' do
    @component = described_class.new *(new_args.push :tool_tip_text => 'Blah')
    @component.tool_tip_text.should == 'Blah'
  end
end
