require 'spec_helper'
require 'swing/shared'

describe Swing::JLabel do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'allows to set properties via constructor' do
      field = Swing::JTextField.new
      icon = Swing::Icon.new
      disabled_icon = Swing::Icon.new
      properties = {
          :disabled_icon => disabled_icon,
          :displayed_mnemonic => 39,
          :displayed_mnemonic_index => -1,
          :horizontal_alignment => Swing::SwingConstants::RIGHT,
          :horizontal_text_position => Swing::JLabel::RIGHT,
          :icon => icon,
          :icon_text_gap => 13,
          :label_for => field,
          :text => 'Bleh',
          :vertical_alignment => Swing::SwingConstants::TOP,
          :vertical_text_position => Swing::JLabel::TOP
      }
      @label = described_class.new *(new_args.push properties)

      properties.each do |name, value|
        @label.send(name).should == value
      end
    end

  end
end
