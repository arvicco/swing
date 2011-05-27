shared_examples_for 'enhanced Awt::Component' do

  after(:each) { @component.dispose if @component.respond_to? :dispose }
  let(:args) { defined?(new_args) ? new_args : [] }
  let(:locale) do
    locales = java.util.Locale.available_locales
    locales[rand(locales.size)]
  end

  context 'new with common properties set in options' do
    it 'sets settable properties via constructor options' do
#      p described_class.attributes
#      p subject.methods.sort.grep /nput/
      properties = {
          :background => Awt::Color.new(1, 2, 3),
          :foreground => Awt::Color.new(3, 2, 1),
          :cursor => Awt::Cursor.new(Awt::Cursor::HAND_CURSOR),
          :enabled => false,
          :visible => false,
          :font => Awt::Font.new("Trebuchet", Awt::Font::PLAIN, 11),
          :locale => locale,
          :location => Awt::Point.new(100, 200),
          :size => Awt::Dimension.new(300, 300),
          :name => 'Blah',
          #          :layout => (defined?(layout) ? layout : Awt::FlowLayout.new),
      }
      @component = described_class.new *(args.push properties)
#      p properties
      properties.each do |name, value|
        @component.send(name).should == value
      end
    end
  end

  context 'new with parent' do
    unless described_class == Swing::JFrame || described_class == Swing::JMenuBar
      it 'sets parent via options' do
        parent = Swing::JPanel.new
        @component = described_class.new *(args.push :parent => parent)
        @component.parent.should == parent
      end
    else
    end
  end
end

shared_examples_for 'enhanced Swing::JComponent' do
  after(:each) { @component.dispose if @component.respond_to? :dispose }
  let(:args) { defined?(new_args) ? new_args : [] }
  let(:border) { Swing::BorderFactory.createEmptyBorder(8, 8, 8, 8) }

  context 'new with common properties set in options' do
    it 'sets settable properties via constructor options' do
      focusable = Swing::JPanel.new
      properties = {
          :action_map => Swing::ActionMap.new,
          :alignmentx => 0.5,
          :alignmenty => 0.5,
          :autoscrolls => true,
          :border => border, #Swing::Border::Border.new, # javax.swing.border.Border.new(3, 2, 1, 1),
          :bounds => Awt::Rectangle.new(3, 2, 1, 1),
          :debug_graphics_options => Swing::DebugGraphics::LOG_OPTION,
          #          :default_locales => true,
          :double_buffered => true,
          #          :input_map => Swing::JComponent::WHEN_FOCUSED,
          #          :input_verifier => Swing::InputVerifier.new,
          #          :insets => Awt::Insets.new(1,1,1,1),
          :maximum_size => Awt::Dimension.new(30, 30),
          :minimum_size => Awt::Dimension.new(30, 30),
          :preferred_size => Awt::Dimension.new(30, 30),
          :opaque => true,
          :next_focusable_component => focusable,
          :request_focus_enabled => false,
          :tool_tip_text => 'Tip',
          :transfer_handler => Swing::TransferHandler.new('color'),
          :verify_input_when_focus_target => false
      }
      @component = described_class.new *(args.push properties)
      properties.each do |name, value|
        @component.send(name).should == value
      end
    end

    it 'even auto-creates proper classes for given properties' do
      properties = {
          :bounds => [3, 2, 10, 10],
          :maximum_size => [40, 40],
          :minimum_size => [20, 20],
          :preferred_size => [30, 30],
          :transfer_handler => 'color',
          #            :border => [8, 8, 8, 8],
          #            :debug_graphics_options => Swing::DebugGraphics::LOG_OPTION,
          #            :input_map => Swing::JComponent::WHEN_FOCUSED,
          #            :input_verifier => Swing::InputVerifier.new,
          #            :insets => Awt::Insets.new(1,1,1,1),
      }
      @component = described_class.new *(args.push properties)
      bounds = @component.bounds
      [bounds.minX, bounds.minY, bounds.width, bounds.height].should == [3, 2, 10, 10]
      @component.minimum_size.should == Awt::Dimension.new(20, 20)
      @component.preferred_size.should == Awt::Dimension.new(30, 30)
      @component.maximum_size.should == Awt::Dimension.new(40, 40)
    end
  end
end
