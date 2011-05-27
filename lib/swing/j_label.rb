require 'swing'

class Swing::JLabel

  # SwingConstants.XYZ or JLabel.XYZ for constants...
  #    UI                     LabelUI • • From L&F
  #    disabledIcon           Icon • • null
  #    displayedMnemonic      int/char • • KeyEvent.VK_UNDEFINED - both int and char setters
  #    displayedMnemonicIndex int -1        ?
  #    horizontalAlignment    int • • LEADING - Also: TRAILING, LEFT, RIGHT, or CENTER
  #    horizontalTextPosition int • • TRAILING - Also LEFT, RIGHT, TOP, BOTTOM, CENTER
  #    icon                   Icon • • null
  #    iconTextGap            int • • 4
  #    labelFor               Component • • null
  #    text                   String • • null
  #    verticalAlignment      int • • CENTER - Also TOP, BOTTOM, or CENTER
  #    verticalTextPosition   int • • CENTER - Also LEFT, RIGHT, TOP, BOTTOM
  #    ----Getters only - NO Setters!
  #    accessibleContext AccessibleContext • JLabel.AccessibleJLabel

  attr_setter :disabled_icon, :displayed_mnemonic, :displayed_mnemonic_index,
              :horizontal_alignment, :horizontal_text_position, :icon, :icon_text_gap,
              :label_for, :text, :vertical_alignment, :vertical_text_position

end # class JLabel

