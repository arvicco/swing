require 'spec_helper'
require 'swing/shared'

class MyAction < Swing::AbstractAction

  def actionPerformed ae
    puts ae
  end
end

describe Swing::JTextField do

  context 'creation' do
    let(:new_args) { ['Text'] }

    it_behaves_like 'enhanced Awt::Component'
    it_behaves_like 'enhanced Swing::JComponent'

    it 'is possible to set :action attribute' do
      action = MyAction.new
      tf = Swing::JTextField.new 'Actionable', :action => action
      tf.get_action.should == action
    end

    it 'is possible to set :action attribute' do
      tf = Swing::JTextField.new 'Centered', :horizontal_alignment => Swing::JTextField::CENTER
      tf.get_horizontal_alignment.should == Swing::JTextField::CENTER
    end

    it 'is possible to set :action_command attribute' do
      doc = Swing.text::PlainDocument.new
      tf = Swing::JTextField.new 'Documented', :document => doc
#      p (tf.methods-Object.methods).sort
      tf.document.should == doc
    end

    it 'accepts action listener block at initialization' do
      button = Swing::JTextField.new('With block') { @block_called = true}
      @block_called.should be_false

      button.postActionEvent # emulate <ENTER>
      @block_called.should be_true
    end

  end
end
